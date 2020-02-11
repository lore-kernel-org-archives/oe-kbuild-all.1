Content-Type: multipart/mixed; boundary="===============4433838644361526072=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [joonsoo-kim:improve-anonymous-lru-management-v1.00-v5.5 3/10] mm/workingset.c:319:53: sparse: sparse: mixing different enum types:
Date: Tue, 11 Feb 2020 22:41:06 +0800
Message-ID: <202002112202.iLfbeHkQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4433838644361526072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/JoonsooKim/linux.git improve-anonymous-lru-manag=
ement-v1.00-v5.5
head:   f4e245c094e983ede2ec1ff56f2ca05131333dee
commit: 724baa463e391a51946f5a68cf18fbb69d0bbbd3 [3/10] mm/workingset: exte=
nd the workingset detection for anon LRU
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-162-g98276e61-dirty
        git checkout 724baa463e391a51946f5a68cf18fbb69d0bbbd3
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> mm/workingset.c:319:53: sparse: sparse: mixing different enum types:
>> mm/workingset.c:319:53: sparse:    unsigned int enum lru_list
>> mm/workingset.c:319:53: sparse:    unsigned int enum node_stat_item
   arch/x86/include/asm/irqflags.h:54:9: sparse: sparse: context imbalance =
in 'shadow_lru_isolate' - wrong count at exit

vim +319 mm/workingset.c

   268	=

   269	/**
   270	 * workingset_refault - evaluate the refault of a previously evicted=
 page
   271	 * @page: the freshly allocated replacement page
   272	 * @shadow: shadow entry of the evicted page
   273	 *
   274	 * Calculates and evaluates the refault distance of the previously
   275	 * evicted page in the context of the node and the memcg whose memory
   276	 * pressure caused the eviction.
   277	 */
   278	void workingset_refault(struct page *page, void *shadow)
   279	{
   280		struct mem_cgroup *eviction_memcg;
   281		struct lruvec *eviction_lruvec;
   282		unsigned long refault_distance;
   283		struct pglist_data *pgdat;
   284		unsigned long active;
   285		struct mem_cgroup *memcg;
   286		unsigned long eviction;
   287		struct lruvec *lruvec;
   288		unsigned long refault;
   289		bool workingset;
   290		int memcgid;
   291		int is_file =3D page_is_file_cache(page);
   292		enum lru_list active_lru =3D page_lru_base_type(page) + LRU_ACTIVE_=
FILE;
   293		enum node_stat_item workingset_stat;
   294	=

   295		unpack_shadow(shadow, &memcgid, &pgdat, &eviction, &workingset);
   296	=

   297		rcu_read_lock();
   298		/*
   299		 * Look up the memcg associated with the stored ID. It might
   300		 * have been deleted since the page's eviction.
   301		 *
   302		 * Note that in rare events the ID could have been recycled
   303		 * for a new cgroup that refaults a shared page. This is
   304		 * impossible to tell from the available data. However, this
   305		 * should be a rare and limited disturbance, and activations
   306		 * are always speculative anyway. Ultimately, it's the aging
   307		 * algorithm's job to shake out the minimum access frequency
   308		 * for the active cache.
   309		 *
   310		 * XXX: On !CONFIG_MEMCG, this will always return NULL; it
   311		 * would be better if the root_mem_cgroup existed in all
   312		 * configurations instead.
   313		 */
   314		eviction_memcg =3D mem_cgroup_from_id(memcgid);
   315		if (!mem_cgroup_disabled() && !eviction_memcg)
   316			goto out;
   317		eviction_lruvec =3D mem_cgroup_lruvec(eviction_memcg, pgdat);
   318		refault =3D atomic_long_read(&eviction_lruvec->inactive_age[is_file=
]);
 > 319		active =3D lruvec_page_state(eviction_lruvec, active_lru);
   320	=

   321		/*
   322		 * Calculate the refault distance
   323		 *
   324		 * The unsigned subtraction here gives an accurate distance
   325		 * across inactive_age overflows in most cases. There is a
   326		 * special case: usually, shadow entries have a short lifetime
   327		 * and are either refaulted or reclaimed along with the inode
   328		 * before they get too old.  But it is not impossible for the
   329		 * inactive_age to lap a shadow entry in the field, which can
   330		 * then result in a false small refault distance, leading to a
   331		 * false activation should this old entry actually refault
   332		 * again.  However, earlier kernels used to deactivate
   333		 * unconditionally with *every* reclaim invocation for the
   334		 * longest time, so the occasional inappropriate activation
   335		 * leading to pressure on the active list is not a problem.
   336		 */
   337		refault_distance =3D (refault - eviction) & EVICTION_MASK;
   338	=

   339		/*
   340		 * The activation decision for this page is made at the level
   341		 * where the eviction occurred, as that is where the LRU order
   342		 * during page reclaim is being determined.
   343		 *
   344		 * However, the cgroup that will own the page is the one that
   345		 * is actually experiencing the refault event.
   346		 */
   347		memcg =3D page_memcg(page);
   348		lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
   349	=

   350		workingset_stat =3D WORKINGSET_REFAULT_BASE + is_file;
   351		inc_lruvec_state(lruvec, workingset_stat);
   352	=

   353		/*
   354		 * Compare the distance to the existing workingset size. We
   355		 * don't act on pages that couldn't stay resident even if all
   356		 * the memory was available to the page cache.
   357		 */
   358		if (refault_distance > active)
   359			goto out;
   360	=

   361		SetPageActive(page);
   362		advance_inactive_age(memcg, pgdat, is_file);
   363		workingset_stat =3D WORKINGSET_ACTIVATE_BASE + is_file;
   364		inc_lruvec_state(lruvec, workingset_stat);
   365	=

   366		/* Page was active prior to eviction */
   367		if (workingset) {
   368			SetPageWorkingset(page);
   369			inc_lruvec_state(lruvec, WORKINGSET_RESTORE);
   370		}
   371	out:
   372		rcu_read_unlock();
   373	}
   374	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4433838644361526072==--

