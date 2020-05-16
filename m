Content-Type: multipart/mixed; boundary="===============3359210299245759434=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/kcsan 14/21] arch/s390/kernel/uv.c:163:23: sparse: sparse: cast to non-scalar
Date: Sat, 16 May 2020 11:24:39 +0800
Message-ID: <202005161137.g7XXG6oe%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3359210299245759434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/kcsan
head:   ffed638b6a2180da8fd002a46632d746af72b299
commit: 7b364f0949ae2dd205d5e9afa4b82ee17030d928 [14/21] READ_ONCE: Drop po=
inter qualifiers when reading from scalar types
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 7b364f0949ae2dd205d5e9afa4b82ee17030d928
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/s390/kernel/uv.c:163:23: sparse: sparse: cast to non-scalar
>> arch/s390/kernel/uv.c:163:23: sparse: sparse: cast from non-scalar
   include/linux/mm.h:1953:21: sparse: sparse: context imbalance in 'gmap_m=
ake_secure' - different lock contexts for basic block
--
>> arch/s390/mm/gmap.c:2666:21: sparse: sparse: cast to non-scalar
>> arch/s390/mm/gmap.c:2666:21: sparse: sparse: cast from non-scalar
   arch/s390/mm/gmap.c:689:17: sparse: sparse: context imbalance in '__gmap=
_zap' - different lock contexts for basic block
   arch/s390/mm/gmap.c:859:16: sparse: sparse: context imbalance in 'gmap_p=
te_op_walk' - different lock contexts for basic block
   arch/s390/mm/gmap.c:898:28: sparse: sparse: context imbalance in 'gmap_p=
te_op_end' - unexpected unlock
   arch/s390/mm/gmap.c:1004:12: sparse: sparse: context imbalance in 'gmap_=
protect_pte' - different lock contexts for basic block
   arch/s390/mm/gmap.c:942:28: sparse: sparse: context imbalance in 'gmap_p=
rotect_range' - unexpected unlock
   arch/s390/mm/gmap.c:2459:6: sparse: sparse: context imbalance in 'gmap_s=
ync_dirty_log_pmd' - different lock contexts for basic block
--
>> arch/s390/kvm/gaccess.c:289:23: sparse: sparse: cast to non-scalar
>> arch/s390/kvm/gaccess.c:289:23: sparse: sparse: cast from non-scalar
   arch/s390/kvm/gaccess.c:314:23: sparse: sparse: cast to non-scalar
   arch/s390/kvm/gaccess.c:314:23: sparse: sparse: cast from non-scalar
   arch/s390/kvm/gaccess.c:332:23: sparse: sparse: cast to non-scalar
   arch/s390/kvm/gaccess.c:332:23: sparse: sparse: cast from non-scalar
   arch/s390/kvm/gaccess.c:352:23: sparse: sparse: cast to non-scalar
   arch/s390/kvm/gaccess.c:352:23: sparse: sparse: cast from non-scalar

vim +163 arch/s390/kernel/uv.c

214d9bbcd3a672 Claudio Imbrenda 2020-01-21  159  =

214d9bbcd3a672 Claudio Imbrenda 2020-01-21  160  static int make_secure_pte=
(pte_t *ptep, unsigned long addr,
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  161  			   struct page *exp_pag=
e, struct uv_cb_header *uvcb)
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  162  {
214d9bbcd3a672 Claudio Imbrenda 2020-01-21 @163  	pte_t entry =3D READ_ONCE=
(*ptep);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  164  	struct page *page;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  165  	int expected, rc =3D 0;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  166  =

214d9bbcd3a672 Claudio Imbrenda 2020-01-21  167  	if (!pte_present(entry))
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  168  		return -ENXIO;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  169  	if (pte_val(entry) & _PAG=
E_INVALID)
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  170  		return -ENXIO;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  171  =

214d9bbcd3a672 Claudio Imbrenda 2020-01-21  172  	page =3D pte_page(entry);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  173  	if (page !=3D exp_page)
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  174  		return -ENXIO;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  175  	if (PageWriteback(page))
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  176  		return -EAGAIN;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  177  	expected =3D expected_pag=
e_refs(page);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  178  	if (!page_ref_freeze(page=
, expected))
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  179  		return -EBUSY;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  180  	set_bit(PG_arch_1, &page-=
>flags);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  181  	rc =3D uv_call(0, (u64)uv=
cb);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  182  	page_ref_unfreeze(page, e=
xpected);
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  183  	/* Return -ENXIO if the p=
age was not mapped, -EINVAL otherwise */
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  184  	if (rc)
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  185  		rc =3D uvcb->rc =3D=3D 0=
x10a ? -ENXIO : -EINVAL;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  186  	return rc;
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  187  }
214d9bbcd3a672 Claudio Imbrenda 2020-01-21  188  =


:::::: The code at line 163 was first introduced by commit
:::::: 214d9bbcd3a67230b932f6cea83c078ab34d9e70 s390/mm: provide memory man=
agement functions for protected KVM guests

:::::: TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
:::::: CC: Christian Borntraeger <borntraeger@de.ibm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3359210299245759434==--

