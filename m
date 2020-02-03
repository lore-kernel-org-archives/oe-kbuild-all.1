Content-Type: multipart/mixed; boundary="===============0075913518916200893=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [block:block-5.6 6/9] drivers/md/bcache/super.c:108:24: sparse: sparse: cast from restricted __le16
Date: Mon, 03 Feb 2020 10:53:30 +0800
Message-ID: <202002030508.FKFGAqRL%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0075913518916200893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it block-5.6
head:   49d08d596e85f39ded48e85df362827cbab1f5ae
commit: 7c02b0055f774ed9afb6e1c7724f33bf148ffdc0 [6/9] bcache: explicity ty=
pe cast in bset_bkey_last()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout 7c02b0055f774ed9afb6e1c7724f33bf148ffdc0
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/md/bcache/super.c:108:24: sparse: sparse: cast from restricted _=
_le16
   drivers/md/bcache/super.c:108:14: sparse: sparse: restricted __le64 degr=
ades to integer
   drivers/md/bcache/super.c:235:21: sparse: sparse: cast from restricted _=
_le16
   drivers/md/bcache/super.c:235:19: sparse: sparse: incorrect type in assi=
gnment (different base types)
   drivers/md/bcache/super.c:235:19: sparse:    expected restricted __le64 =
[usertype] csum
   drivers/md/bcache/super.c:235:19: sparse:    got unsigned long long
   drivers/md/bcache/super.c:572:33: sparse: sparse: incorrect type in assi=
gnment (different base types)
   drivers/md/bcache/super.c:572:33: sparse:    expected unsigned short [us=
ertype] prio
   drivers/md/bcache/super.c:572:33: sparse:    got restricted __le16 [user=
type]
   drivers/md/bcache/super.c:640:27: sparse: sparse: cast to restricted __l=
e16
   drivers/md/bcache/super.c:742:32: sparse: sparse: incorrect type in assi=
gnment (different base types)
   drivers/md/bcache/super.c:742:32: sparse:    expected unsigned int [user=
type] invalidated
   drivers/md/bcache/super.c:742:32: sparse:    got restricted __le32 [user=
type]
   drivers/md/bcache/super.c:1102:26: sparse: sparse: incorrect type in ini=
tializer (different base types)
   drivers/md/bcache/super.c:1102:26: sparse:    expected unsigned int [use=
rtype] rtime
   drivers/md/bcache/super.c:1102:26: sparse:    got restricted __le32 [use=
rtype]
   drivers/md/bcache/super.c:1146:32: sparse: sparse: incorrect type in ass=
ignment (different base types)
   drivers/md/bcache/super.c:1146:32: sparse:    expected unsigned int [use=
rtype] invalidated
   drivers/md/bcache/super.c:1146:32: sparse:    got restricted __le32 [use=
rtype]
   drivers/md/bcache/super.c:1496:36: sparse: sparse: incorrect type in ass=
ignment (different base types)
   drivers/md/bcache/super.c:1496:36: sparse:    expected unsigned int [use=
rtype] last_reg
   drivers/md/bcache/super.c:1496:36: sparse:    got restricted __le32 [use=
rtype]

vim +108 drivers/md/bcache/super.c

cafe563591446c Kent Overstreet   2013-03-23   60  =

cafe563591446c Kent Overstreet   2013-03-23   61  static const char *read_s=
uper(struct cache_sb *sb, struct block_device *bdev,
cfa0c56db9c087 Christoph Hellwig 2020-01-24   62  			      struct cache_sb_=
disk **res)
cafe563591446c Kent Overstreet   2013-03-23   63  {
cafe563591446c Kent Overstreet   2013-03-23   64  	const char *err;
a702a692cd7559 Christoph Hellwig 2020-01-24   65  	struct cache_sb_disk *s;
6321bef028de43 Christoph Hellwig 2020-01-24   66  	struct page *page;
6f10f7d1b02b1b Coly Li           2018-08-11   67  	unsigned int i;
cafe563591446c Kent Overstreet   2013-03-23   68  =

6321bef028de43 Christoph Hellwig 2020-01-24   69  	page =3D read_cache_page=
_gfp(bdev->bd_inode->i_mapping,
6321bef028de43 Christoph Hellwig 2020-01-24   70  				   SB_OFFSET >> PAGE_=
SHIFT, GFP_KERNEL);
6321bef028de43 Christoph Hellwig 2020-01-24   71  	if (IS_ERR(page))
cafe563591446c Kent Overstreet   2013-03-23   72  		return "IO error";
6321bef028de43 Christoph Hellwig 2020-01-24   73  	s =3D page_address(page)=
 + offset_in_page(SB_OFFSET);
cafe563591446c Kent Overstreet   2013-03-23   74  =

cafe563591446c Kent Overstreet   2013-03-23   75  	sb->offset		=3D le64_to_=
cpu(s->offset);
cafe563591446c Kent Overstreet   2013-03-23   76  	sb->version		=3D le64_to=
_cpu(s->version);
cafe563591446c Kent Overstreet   2013-03-23   77  =

cafe563591446c Kent Overstreet   2013-03-23   78  	memcpy(sb->magic,	s->mag=
ic, 16);
cafe563591446c Kent Overstreet   2013-03-23   79  	memcpy(sb->uuid,	s->uuid=
, 16);
cafe563591446c Kent Overstreet   2013-03-23   80  	memcpy(sb->set_uuid,	s->=
set_uuid, 16);
cafe563591446c Kent Overstreet   2013-03-23   81  	memcpy(sb->label,	s->lab=
el, SB_LABEL_SIZE);
cafe563591446c Kent Overstreet   2013-03-23   82  =

cafe563591446c Kent Overstreet   2013-03-23   83  	sb->flags		=3D le64_to_c=
pu(s->flags);
cafe563591446c Kent Overstreet   2013-03-23   84  	sb->seq			=3D le64_to_cp=
u(s->seq);
cafe563591446c Kent Overstreet   2013-03-23   85  	sb->last_mount		=3D le32=
_to_cpu(s->last_mount);
cafe563591446c Kent Overstreet   2013-03-23   86  	sb->first_bucket	=3D le1=
6_to_cpu(s->first_bucket);
cafe563591446c Kent Overstreet   2013-03-23   87  	sb->keys		=3D le16_to_cp=
u(s->keys);
cafe563591446c Kent Overstreet   2013-03-23   88  =

cafe563591446c Kent Overstreet   2013-03-23   89  	for (i =3D 0; i < SB_JOU=
RNAL_BUCKETS; i++)
cafe563591446c Kent Overstreet   2013-03-23   90  		sb->d[i] =3D le64_to_cp=
u(s->d[i]);
cafe563591446c Kent Overstreet   2013-03-23   91  =

cafe563591446c Kent Overstreet   2013-03-23   92  	pr_debug("read sb versio=
n %llu, flags %llu, seq %llu, journal size %u",
cafe563591446c Kent Overstreet   2013-03-23   93  		 sb->version, sb->flags=
, sb->seq, sb->keys);
cafe563591446c Kent Overstreet   2013-03-23   94  =

aaf8dbeab58657 Coly Li           2019-11-13   95  	err =3D "Not a bcache su=
perblock (bad offset)";
cafe563591446c Kent Overstreet   2013-03-23   96  	if (sb->offset !=3D SB_S=
ECTOR)
cafe563591446c Kent Overstreet   2013-03-23   97  		goto err;
cafe563591446c Kent Overstreet   2013-03-23   98  =

aaf8dbeab58657 Coly Li           2019-11-13   99  	err =3D "Not a bcache su=
perblock (bad magic)";
cafe563591446c Kent Overstreet   2013-03-23  100  	if (memcmp(sb->magic, bc=
ache_magic, 16))
cafe563591446c Kent Overstreet   2013-03-23  101  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  102  =

cafe563591446c Kent Overstreet   2013-03-23  103  	err =3D "Too many journa=
l buckets";
cafe563591446c Kent Overstreet   2013-03-23  104  	if (sb->keys > SB_JOURNA=
L_BUCKETS)
cafe563591446c Kent Overstreet   2013-03-23  105  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  106  =

cafe563591446c Kent Overstreet   2013-03-23  107  	err =3D "Bad checksum";
cafe563591446c Kent Overstreet   2013-03-23 @108  	if (s->csum !=3D csum_se=
t(s))
cafe563591446c Kent Overstreet   2013-03-23  109  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  110  =

cafe563591446c Kent Overstreet   2013-03-23  111  	err =3D "Bad UUID";
169ef1cf6171d3 Kent Overstreet   2013-03-28  112  	if (bch_is_zero(sb->uuid=
, 16))
cafe563591446c Kent Overstreet   2013-03-23  113  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  114  =

8abb2a5dbadab9 Kent Overstreet   2013-04-23  115  	sb->block_size	=3D le16_=
to_cpu(s->block_size);
8abb2a5dbadab9 Kent Overstreet   2013-04-23  116  =

8abb2a5dbadab9 Kent Overstreet   2013-04-23  117  	err =3D "Superblock bloc=
k size smaller than device block size";
8abb2a5dbadab9 Kent Overstreet   2013-04-23  118  	if (sb->block_size << 9 =
< bdev_logical_block_size(bdev))
8abb2a5dbadab9 Kent Overstreet   2013-04-23  119  		goto err;
8abb2a5dbadab9 Kent Overstreet   2013-04-23  120  =

2903381fce7100 Kent Overstreet   2013-04-11  121  	switch (sb->version) {
2903381fce7100 Kent Overstreet   2013-04-11  122  	case BCACHE_SB_VERSION_B=
DEV:
2903381fce7100 Kent Overstreet   2013-04-11  123  		sb->data_offset	=3D BDE=
V_DATA_START_DEFAULT;
2903381fce7100 Kent Overstreet   2013-04-11  124  		break;
2903381fce7100 Kent Overstreet   2013-04-11  125  	case BCACHE_SB_VERSION_B=
DEV_WITH_OFFSET:
2903381fce7100 Kent Overstreet   2013-04-11  126  		sb->data_offset	=3D le6=
4_to_cpu(s->data_offset);
cafe563591446c Kent Overstreet   2013-03-23  127  =

2903381fce7100 Kent Overstreet   2013-04-11  128  		err =3D "Bad data offse=
t";
2903381fce7100 Kent Overstreet   2013-04-11  129  		if (sb->data_offset < B=
DEV_DATA_START_DEFAULT)
cafe563591446c Kent Overstreet   2013-03-23  130  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  131  =

2903381fce7100 Kent Overstreet   2013-04-11  132  		break;
2903381fce7100 Kent Overstreet   2013-04-11  133  	case BCACHE_SB_VERSION_C=
DEV:
2903381fce7100 Kent Overstreet   2013-04-11  134  	case BCACHE_SB_VERSION_C=
DEV_WITH_UUID:
2903381fce7100 Kent Overstreet   2013-04-11  135  		sb->nbuckets	=3D le64_t=
o_cpu(s->nbuckets);
2903381fce7100 Kent Overstreet   2013-04-11  136  		sb->bucket_size	=3D le1=
6_to_cpu(s->bucket_size);
2903381fce7100 Kent Overstreet   2013-04-11  137  =

2903381fce7100 Kent Overstreet   2013-04-11  138  		sb->nr_in_set	=3D le16_=
to_cpu(s->nr_in_set);
2903381fce7100 Kent Overstreet   2013-04-11  139  		sb->nr_this_dev	=3D le1=
6_to_cpu(s->nr_this_dev);
2903381fce7100 Kent Overstreet   2013-04-11  140  =

cafe563591446c Kent Overstreet   2013-03-23  141  		err =3D "Too many bucke=
ts";
cafe563591446c Kent Overstreet   2013-03-23  142  		if (sb->nbuckets > LONG=
_MAX)
cafe563591446c Kent Overstreet   2013-03-23  143  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  144  =

cafe563591446c Kent Overstreet   2013-03-23  145  		err =3D "Not enough buc=
kets";
cafe563591446c Kent Overstreet   2013-03-23  146  		if (sb->nbuckets < 1 <<=
 7)
cafe563591446c Kent Overstreet   2013-03-23  147  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  148  =

2903381fce7100 Kent Overstreet   2013-04-11  149  		err =3D "Bad block/buck=
et size";
2903381fce7100 Kent Overstreet   2013-04-11  150  		if (!is_power_of_2(sb->=
block_size) ||
2903381fce7100 Kent Overstreet   2013-04-11  151  		    sb->block_size > PA=
GE_SECTORS ||
2903381fce7100 Kent Overstreet   2013-04-11  152  		    !is_power_of_2(sb->=
bucket_size) ||
2903381fce7100 Kent Overstreet   2013-04-11  153  		    sb->bucket_size < P=
AGE_SECTORS)
2903381fce7100 Kent Overstreet   2013-04-11  154  			goto err;
2903381fce7100 Kent Overstreet   2013-04-11  155  =

cafe563591446c Kent Overstreet   2013-03-23  156  		err =3D "Invalid superb=
lock: device too small";
b0d30981c05f32 Coly Li           2018-08-11  157  		if (get_capacity(bdev->=
bd_disk) <
b0d30981c05f32 Coly Li           2018-08-11  158  		    sb->bucket_size * s=
b->nbuckets)
cafe563591446c Kent Overstreet   2013-03-23  159  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  160  =

cafe563591446c Kent Overstreet   2013-03-23  161  		err =3D "Bad UUID";
169ef1cf6171d3 Kent Overstreet   2013-03-28  162  		if (bch_is_zero(sb->set=
_uuid, 16))
cafe563591446c Kent Overstreet   2013-03-23  163  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  164  =

cafe563591446c Kent Overstreet   2013-03-23  165  		err =3D "Bad cache devi=
ce number in set";
cafe563591446c Kent Overstreet   2013-03-23  166  		if (!sb->nr_in_set ||
cafe563591446c Kent Overstreet   2013-03-23  167  		    sb->nr_in_set <=3D =
sb->nr_this_dev ||
cafe563591446c Kent Overstreet   2013-03-23  168  		    sb->nr_in_set > MAX=
_CACHES_PER_SET)
cafe563591446c Kent Overstreet   2013-03-23  169  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  170  =

cafe563591446c Kent Overstreet   2013-03-23  171  		err =3D "Journal bucket=
s not sequential";
cafe563591446c Kent Overstreet   2013-03-23  172  		for (i =3D 0; i < sb->k=
eys; i++)
cafe563591446c Kent Overstreet   2013-03-23  173  			if (sb->d[i] !=3D sb->=
first_bucket + i)
cafe563591446c Kent Overstreet   2013-03-23  174  				goto err;
cafe563591446c Kent Overstreet   2013-03-23  175  =

cafe563591446c Kent Overstreet   2013-03-23  176  		err =3D "Too many journ=
al buckets";
cafe563591446c Kent Overstreet   2013-03-23  177  		if (sb->first_bucket + =
sb->keys > sb->nbuckets)
cafe563591446c Kent Overstreet   2013-03-23  178  			goto err;
cafe563591446c Kent Overstreet   2013-03-23  179  =

cafe563591446c Kent Overstreet   2013-03-23  180  		err =3D "Invalid superb=
lock: first bucket comes before end of super";
cafe563591446c Kent Overstreet   2013-03-23  181  		if (sb->first_bucket * =
sb->bucket_size < 16)
cafe563591446c Kent Overstreet   2013-03-23  182  			goto err;
2903381fce7100 Kent Overstreet   2013-04-11  183  =

2903381fce7100 Kent Overstreet   2013-04-11  184  		break;
2903381fce7100 Kent Overstreet   2013-04-11  185  	default:
2903381fce7100 Kent Overstreet   2013-04-11  186  		err =3D "Unsupported su=
perblock version";
2903381fce7100 Kent Overstreet   2013-04-11  187  		goto err;
2903381fce7100 Kent Overstreet   2013-04-11  188  	}
2903381fce7100 Kent Overstreet   2013-04-11  189  =

75cbb3f1d84042 Arnd Bergmann     2018-07-26  190  	sb->last_mount =3D (u32)=
ktime_get_real_seconds();
cfa0c56db9c087 Christoph Hellwig 2020-01-24  191  	*res =3D s;
6321bef028de43 Christoph Hellwig 2020-01-24  192  	return NULL;
cafe563591446c Kent Overstreet   2013-03-23  193  err:
6321bef028de43 Christoph Hellwig 2020-01-24  194  	put_page(page);
cafe563591446c Kent Overstreet   2013-03-23  195  	return err;
cafe563591446c Kent Overstreet   2013-03-23  196  }
cafe563591446c Kent Overstreet   2013-03-23  197  =


:::::: The code at line 108 was first introduced by commit
:::::: cafe563591446cf80bfbc2fe3bc72a2e36cf1060 bcache: A block layer cache

:::::: TO: Kent Overstreet <koverstreet@google.com>
:::::: CC: Kent Overstreet <koverstreet@google.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============0075913518916200893==--

