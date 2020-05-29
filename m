Content-Type: multipart/mixed; boundary="===============7305924864125676640=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 7576/13554] drivers/md/dm-integrity.c:1895:33: sparse: sparse: incorrect type in assignment (different base types)
Date: Fri, 29 May 2020 11:07:25 +0800
Message-ID: <202005291123.9he0pbPQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7305924864125676640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ff387fc20c697cdc887b2abf7ef494e853795a2f
commit: bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417 [7576/13554] READ_ONCE: Si=
mplify implementations of {READ,WRITE}_ONCE()
config: x86_64-randconfig-s021-20200528 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-240-gf0fe1cd9-dirty
        git checkout bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dx86_64 CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/md/dm-integrity.c:2004:33: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2005:33: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] sect=
or_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2005:33: sparse:     expected unsigned int [us=
ertype] sector_hi
   drivers/md/dm-integrity.c:2005:33: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:2131:37: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2132:72: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:396:38: sparse: sparse: restricted __le64 degr=
ades to integer
   drivers/md/dm-integrity.c:471:29: sparse: sparse: restricted __le32 degr=
ades to integer
   drivers/md/dm-integrity.c:473:53: sparse: sparse: restricted __le32 degr=
ades to integer
   drivers/md/dm-integrity.c:475:50: sparse: sparse: restricted __le32 degr=
ades to integer
   drivers/md/dm-integrity.c:1497:27: sparse: sparse: incorrect type in ini=
tializer (different base types) @@     expected unsigned long long [usertyp=
e] sector_le @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:1497:27: sparse:     expected unsigned long lo=
ng [usertype] sector_le
   drivers/md/dm-integrity.c:1497:27: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:1818:37: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:1822:41: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:1826:33: sparse: sparse: cast to restricted __=
le64
>> drivers/md/dm-integrity.c:1895:33: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long volatile =
@@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:1895:33: sparse:     expected unsigned long lo=
ng volatile
   drivers/md/dm-integrity.c:1895:33: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:2219:25: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2219:25: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2303:29: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2305:25: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2306:31: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:2320:37: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2322:33: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2323:40: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:2348:41: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] sect=
or_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2348:41: sparse:     expected unsigned int [us=
ertype] sector_hi
   drivers/md/dm-integrity.c:2348:41: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:2357:41: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] sect=
or_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2357:41: sparse:     expected unsigned int [us=
ertype] sector_hi
   drivers/md/dm-integrity.c:2357:41: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:2391:33: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] sect=
or_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2391:33: sparse:     expected unsigned int [us=
ertype] sector_hi
   drivers/md/dm-integrity.c:2391:33: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:2491:32: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:2576:31: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2576:31: sparse:     expected unsigned long lo=
ng [usertype] recalc_sector
   drivers/md/dm-integrity.c:2576:31: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:2663:29: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2664:25: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:2704:25: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] sect=
or_hi @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:2704:25: sparse:     expected unsigned int [us=
ertype] sector_hi
   drivers/md/dm-integrity.c:2704:25: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:2776:38: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2937:31: sparse: sparse: invalid assignment: &=
=3D
   drivers/md/dm-integrity.c:2937:31: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:2937:31: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:2952:43: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:2969:47: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] provided_data_sectors @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2969:47: sparse:     expected unsigned long lo=
ng [usertype] provided_data_sectors
   drivers/md/dm-integrity.c:2969:47: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:2975:29: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:2985:55: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:2985:55: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:2985:55: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:2986:63: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2986:63: sparse:     expected unsigned long lo=
ng [usertype] recalc_sector
   drivers/md/dm-integrity.c:2986:63: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:2997:47: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:2997:47: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:2997:47: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:2998:55: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:2998:55: sparse:     expected unsigned long lo=
ng [usertype] recalc_sector
   drivers/md/dm-integrity.c:2998:55: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:3003:47: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:3003:47: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:3003:47: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:3004:55: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3004:55: sparse:     expected unsigned long lo=
ng [usertype] recalc_sector
   drivers/md/dm-integrity.c:3004:55: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:3008:39: sparse: sparse: invalid assignment: &=
=3D
   drivers/md/dm-integrity.c:3008:39: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:3008:39: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:3016:39: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:3016:39: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:3016:39: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:3025:45: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3026:29: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3027:66: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3028:77: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3029:72: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3030:77: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3031:75: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3032:77: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3040:29: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3041:36: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3046:47: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned long long [usertype=
] recalc_sector @@     got restricted __le64 [usertype] @@
   drivers/md/dm-integrity.c:3046:47: sparse:     expected unsigned long lo=
ng [usertype] recalc_sector
   drivers/md/dm-integrity.c:3046:47: sparse:     got restricted __le64 [us=
ertype]
   drivers/md/dm-integrity.c:3074:37: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3075:25: sparse: sparse: cast to restricted __=
le64
   drivers/md/dm-integrity.c:3087:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3096:47: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3103:37: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3118:38: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3163:32: sparse: sparse: cast to restricted __=
le32
   drivers/md/dm-integrity.c:3167:29: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3190:41: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/md/dm-integrity.c:3245:36: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned short [usertype] in=
tegrity_tag_size @@     got restricted __le16 [usertype] @@
   drivers/md/dm-integrity.c:3245:36: sparse:     expected unsigned short [=
usertype] integrity_tag_size
   drivers/md/dm-integrity.c:3245:36: sparse:     got restricted __le16 [us=
ertype]
   drivers/md/dm-integrity.c:3248:31: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:3248:31: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:3248:31: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:3257:39: sparse: sparse: invalid assignment: |=
=3D
   drivers/md/dm-integrity.c:3257:39: sparse:    left side has type unsigne=
d int
   drivers/md/dm-integrity.c:3257:39: sparse:    right side has type restri=
cted __le32
   drivers/md/dm-integrity.c:3258:42: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] jour=
nal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3258:42: sparse:     expected unsigned int [us=
ertype] journal_sections
   drivers/md/dm-integrity.c:3258:42: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:3276:42: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] jour=
nal_sections @@     got restricted __le32 [usertype] @@
   drivers/md/dm-integrity.c:3276:42: sparse:     expected unsigned int [us=
ertype] journal_sections
   drivers/md/dm-integrity.c:3276:42: sparse:     got restricted __le32 [us=
ertype]
   drivers/md/dm-integrity.c:3278:55: sparse: sparse: cast to restricted __=
le32
   drivers/md/dm-integrity.c:3282:50: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected unsigned int [usertype] jour=
nal_sections @@     got restricted __le32 [usertype] @@

vim +1895 drivers/md/dm-integrity.c

7eada909bfd7ac Mikulas Patocka 2017-01-04  1787  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1788  static bool __journal_read=
_write(struct dm_integrity_io *dio, struct bio *bio,
7eada909bfd7ac Mikulas Patocka 2017-01-04  1789  				 unsigned journal_sect=
ion, unsigned journal_entry)
7eada909bfd7ac Mikulas Patocka 2017-01-04  1790  {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1791  	struct dm_integrity_c *ic=
 =3D dio->ic;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1792  	sector_t logical_sector;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1793  	unsigned n_sectors;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1794  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1795  	logical_sector =3D dio->r=
ange.logical_sector;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1796  	n_sectors =3D dio->range.=
n_sectors;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1797  	do {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1798  		struct bio_vec bv =3D bi=
o_iovec(bio);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1799  		char *mem;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1800  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1801  		if (unlikely(bv.bv_len >=
> SECTOR_SHIFT > n_sectors))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1802  			bv.bv_len =3D n_sectors=
 << SECTOR_SHIFT;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1803  		n_sectors -=3D bv.bv_len=
 >> SECTOR_SHIFT;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1804  		bio_advance_iter(bio, &b=
io->bi_iter, bv.bv_len);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1805  retry_kmap:
7eada909bfd7ac Mikulas Patocka 2017-01-04  1806  		mem =3D kmap_atomic(bv.b=
v_page);
84597a44a9d86a Mikulas Patocka 2020-03-22  1807  		if (likely(dio->op =3D=
=3D REQ_OP_WRITE))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1808  			flush_dcache_page(bv.bv=
_page);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1809  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1810  		do {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1811  			struct journal_entry *j=
e =3D access_journal_entry(ic, journal_section, journal_entry);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1812  =

84597a44a9d86a Mikulas Patocka 2020-03-22  1813  			if (unlikely(dio->op =
=3D=3D REQ_OP_READ)) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1814  				struct journal_sector =
*js;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1815  				char *mem_ptr;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1816  				unsigned s;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1817  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1818  				if (unlikely(journal_e=
ntry_is_inprogress(je))) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1819  					flush_dcache_page(bv.=
bv_page);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1820  					kunmap_atomic(mem);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1821  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1822  					__io_wait_event(ic->c=
opy_to_journal_wait, !journal_entry_is_inprogress(je));
7eada909bfd7ac Mikulas Patocka 2017-01-04  1823  					goto retry_kmap;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1824  				}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1825  				smp_rmb();
7eada909bfd7ac Mikulas Patocka 2017-01-04  1826  				BUG_ON(journal_entry_g=
et_sector(je) !=3D logical_sector);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1827  				js =3D access_journal_=
data(ic, journal_section, journal_entry);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1828  				mem_ptr =3D mem + bv.b=
v_offset;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1829  				s =3D 0;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1830  				do {
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1831  					memcpy(mem_ptr, js, J=
OURNAL_SECTOR_DATA);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1832  					*(commit_id_t *)(mem_=
ptr + JOURNAL_SECTOR_DATA) =3D je->last_bytes[s];
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1833  					js++;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1834  					mem_ptr +=3D 1 << SEC=
TOR_SHIFT;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1835  				} while (++s < ic->sec=
tors_per_block);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1836  #ifdef INTERNAL_VERIFY
7eada909bfd7ac Mikulas Patocka 2017-01-04  1837  				if (ic->internal_hash)=
 {
b93b6643e9b5a7 Mikulas Patocka 2020-03-22  1838  					char checksums_onstac=
k[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
7eada909bfd7ac Mikulas Patocka 2017-01-04  1839  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1840  					integrity_sector_chec=
ksum(ic, logical_sector, mem + bv.bv_offset, checksums_onstack);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1841  					if (unlikely(memcmp(c=
hecksums_onstack, journal_entry_tag(ic, je), ic->tag_size))) {
22555744685644 Mikulas Patocka 2019-03-06  1842  						DMERR_LIMIT("Checksu=
m failed when reading from journal, at sector 0x%llx",
7649194a1636ab Mikulas Patocka 2020-03-22  1843  							    logical_sector);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1844  					}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1845  				}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1846  #endif
7eada909bfd7ac Mikulas Patocka 2017-01-04  1847  			}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1848  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1849  			if (!ic->internal_hash)=
 {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1850  				struct bio_integrity_p=
ayload *bip =3D bio_integrity(bio);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1851  				unsigned tag_todo =3D =
ic->tag_size;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1852  				char *tag_ptr =3D jour=
nal_entry_tag(ic, je);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1853  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1854  				if (bip) do {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1855  					struct bio_vec biv =
=3D bvec_iter_bvec(bip->bip_vec, bip->bip_iter);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1856  					unsigned tag_now =3D =
min(biv.bv_len, tag_todo);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1857  					char *tag_addr;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1858  					BUG_ON(PageHighMem(bi=
v.bv_page));
7eada909bfd7ac Mikulas Patocka 2017-01-04  1859  					tag_addr =3D lowmem_p=
age_address(biv.bv_page) + biv.bv_offset;
84597a44a9d86a Mikulas Patocka 2020-03-22  1860  					if (likely(dio->op =
=3D=3D REQ_OP_WRITE))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1861  						memcpy(tag_ptr, tag_=
addr, tag_now);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1862  					else
7eada909bfd7ac Mikulas Patocka 2017-01-04  1863  						memcpy(tag_addr, tag=
_ptr, tag_now);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1864  					bvec_iter_advance(bip=
->bip_vec, &bip->bip_iter, tag_now);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1865  					tag_ptr +=3D tag_now;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1866  					tag_todo -=3D tag_now;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1867  				} while (unlikely(tag_=
todo)); else {
84597a44a9d86a Mikulas Patocka 2020-03-22  1868  					if (likely(dio->op =
=3D=3D REQ_OP_WRITE))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1869  						memset(tag_ptr, 0, t=
ag_todo);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1870  				}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1871  			}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1872  =

84597a44a9d86a Mikulas Patocka 2020-03-22  1873  			if (likely(dio->op =3D=
=3D REQ_OP_WRITE)) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1874  				struct journal_sector =
*js;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1875  				unsigned s;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1876  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1877  				js =3D access_journal_=
data(ic, journal_section, journal_entry);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1878  				memcpy(js, mem + bv.bv=
_offset, ic->sectors_per_block << SECTOR_SHIFT);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1879  =

9d609f85b7eb96 Mikulas Patocka 2017-04-18  1880  				s =3D 0;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1881  				do {
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1882  					je->last_bytes[s] =3D=
 js[s].commit_id;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1883  				} while (++s < ic->sec=
tors_per_block);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1884  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1885  				if (ic->internal_hash)=
 {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1886  					unsigned digest_size =
=3D crypto_shash_digestsize(ic->internal_hash);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1887  					if (unlikely(digest_s=
ize > ic->tag_size)) {
6d39a1241ebc3b Kees Cook       2018-08-07  1888  						char checksums_onsta=
ck[HASH_MAX_DIGESTSIZE];
7eada909bfd7ac Mikulas Patocka 2017-01-04  1889  						integrity_sector_che=
cksum(ic, logical_sector, (char *)js, checksums_onstack);
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1890  						memcpy(journal_entry=
_tag(ic, je), checksums_onstack, ic->tag_size);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1891  					} else
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1892  						integrity_sector_che=
cksum(ic, logical_sector, (char *)js, journal_entry_tag(ic, je));
7eada909bfd7ac Mikulas Patocka 2017-01-04  1893  				}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1894  =

7eada909bfd7ac Mikulas Patocka 2017-01-04 @1895  				journal_entry_set_sect=
or(je, logical_sector);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1896  			}
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1897  			logical_sector +=3D ic-=
>sectors_per_block;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1898  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1899  			journal_entry++;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1900  			if (unlikely(journal_en=
try =3D=3D ic->journal_section_entries)) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1901  				journal_entry =3D 0;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1902  				journal_section++;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1903  				wraparound_section(ic,=
 &journal_section);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1904  			}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1905  =

9d609f85b7eb96 Mikulas Patocka 2017-04-18  1906  			bv.bv_offset +=3D ic->s=
ectors_per_block << SECTOR_SHIFT;
9d609f85b7eb96 Mikulas Patocka 2017-04-18  1907  		} while (bv.bv_len -=3D =
ic->sectors_per_block << SECTOR_SHIFT);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1908  =

84597a44a9d86a Mikulas Patocka 2020-03-22  1909  		if (unlikely(dio->op =3D=
=3D REQ_OP_READ))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1910  			flush_dcache_page(bv.bv=
_page);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1911  		kunmap_atomic(mem);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1912  	} while (n_sectors);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1913  =

84597a44a9d86a Mikulas Patocka 2020-03-22  1914  	if (likely(dio->op =3D=3D=
 REQ_OP_WRITE)) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1915  		smp_mb();
7eada909bfd7ac Mikulas Patocka 2017-01-04  1916  		if (unlikely(waitqueue_a=
ctive(&ic->copy_to_journal_wait)))
7eada909bfd7ac Mikulas Patocka 2017-01-04  1917  			wake_up(&ic->copy_to_jo=
urnal_wait);
d3e632f07b6e63 Mark Rutland    2017-10-23  1918  		if (READ_ONCE(ic->free_s=
ectors) <=3D ic->free_sectors_threshold) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1919  			queue_work(ic->commit_w=
q, &ic->commit_work);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1920  		} else {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1921  			schedule_autocommit(ic);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1922  		}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1923  	} else {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1924  		remove_range(ic, &dio->r=
ange);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1925  	}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1926  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1927  	if (unlikely(bio->bi_iter=
.bi_size)) {
7eada909bfd7ac Mikulas Patocka 2017-01-04  1928  		sector_t area, offset;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1929  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1930  		dio->range.logical_secto=
r =3D logical_sector;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1931  		get_area_and_offset(ic, =
dio->range.logical_sector, &area, &offset);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1932  		dio->metadata_block =3D =
get_metadata_sector_and_offset(ic, area, offset, &dio->metadata_offset);
7eada909bfd7ac Mikulas Patocka 2017-01-04  1933  		return true;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1934  	}
7eada909bfd7ac Mikulas Patocka 2017-01-04  1935  =

7eada909bfd7ac Mikulas Patocka 2017-01-04  1936  	return false;
7eada909bfd7ac Mikulas Patocka 2017-01-04  1937  }
7eada909bfd7ac Mikulas Patocka 2017-01-04  1938  =


:::::: The code at line 1895 was first introduced by commit
:::::: 7eada909bfd7ac90a4522e56aa3179d1fd68cd14 dm: add integrity target

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7305924864125676640==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
uGzMA9b+PYQL1sNvjh6ij3Lo+h9N+XcuyDkCAA==
--===============7305924864125676640==--

