Content-Type: multipart/mixed; boundary="===============1427824672105104768=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-block:blk-accounting-cleanup 1/16] include/linux/blkdev.h:1908:31: error: dereferencing pointer to incomplete type 'struct bio'
Date: Tue, 26 May 2020 17:48:44 +0800
Message-ID: <202005261740.IOXN96OL%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1427824672105104768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/block.git blk-accounting-cleanup
head:   426c2d7f0c7434a57d66be949f1c20e87f8f94ac
commit: 6affa383c213074810553ceb6d97493a9404f09c [1/16] block: add disk/bio=
-based accounting helpers
config: nds32-allnoconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6affa383c213074810553ceb6d97493a9404f09c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/linux/backing-dev.h:15,
from fs//ramfs/inode.c:32:
include/linux/blkdev.h: In function 'bio_start_io_acct':
>> include/linux/blkdev.h:1908:31: error: dereferencing pointer to incomple=
te type 'struct bio'
1908 |  return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bi=
o));
|                               ^~
include/linux/blkdev.h:1908:42: error: implicit declaration of function 'bi=
o_sectors' [-Werror=3Dimplicit-function-declaration]
1908 |  return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bi=
o));
|                                          ^~~~~~~~~~~
>> include/linux/blkdev.h:1908:60: error: implicit declaration of function =
'bio_op' [-Werror=3Dimplicit-function-declaration]
1908 |  return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bi=
o));
|                                                            ^~~~~~
include/linux/blkdev.h: In function 'bio_end_io_acct':
>> include/linux/blkdev.h:1918:9: warning: 'return' with a value, in functi=
on returning void [-Wreturn-type]
1918 |  return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
|         ^~~~~~~~~~~~~~~~
include/linux/blkdev.h:1916:20: note: declared here
1916 | static inline void bio_end_io_acct(struct bio *bio, unsigned long st=
art_time)
|                    ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

vim +1908 include/linux/blkdev.h

  1894	=

  1895	unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int =
sectors,
  1896			unsigned int op);
  1897	void disk_end_io_acct(struct gendisk *disk, unsigned int op,
  1898			unsigned long start_time);
  1899	=

  1900	/**
  1901	 * bio_start_io_acct - start I/O accounting for bio based drivers
  1902	 * @bio:	bio to start account for
  1903	 *
  1904	 * Returns the start time that should be passed back to bio_end_io_a=
cct().
  1905	 */
  1906	static inline unsigned long bio_start_io_acct(struct bio *bio)
  1907	{
> 1908		return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bi=
o));
  1909	}
  1910	=

  1911	/**
  1912	 * bio_end_io_acct - end I/O accounting for bio based drivers
  1913	 * @bio:	bio to end account for
  1914	 * @start:	start time returned by bio_start_io_acct()
  1915	 */
  1916	static inline void bio_end_io_acct(struct bio *bio, unsigned long st=
art_time)
  1917	{
> 1918		return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
  1919	}
  1920	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1427824672105104768==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICADhzF4AAy5jb25maWcAnVxbk9u2kn7Pr2DFVVtJle3MzU6yW/MAkaCEI96GAKUZv7BkiTNW
eUaao0ti76/fboAUQbIh5+ypHHvMbtwaje6vG41589Mbjx0P25fFYb1cPD9/956qTbVbHKqV97h+
rv7HC1IvSZXHA6HeA3O03hy//bZZ7a+vvA/vf39/8W63vPKm1W5TPXv+dvO4fjpC8/V289Obn+C/
N/Dx5RV62v23p1s9V++esY93T8ul98vY93/1/nx//f4CeP00CcW49P1SyBIot9+bT/CPcsZzKdLk
9s+L64uLhhAFp+9X1zcX+n+nfiKWjE/kC6v7CZMlk3E5TlXaDmIRRBKJhA9Ic5YnZcweRrwsEpEI
JVgkPvGgZVSTnLMA2ocp/FEqJqdA1HIYa8E+e/vqcHxtVzvK0ylPyjQpZZy1HWHvJU9mJcthlSIW
6vb6CqVZTyiNMxHxUnGpvPXe22wP2PFJLKnPomblP//ctrMJJStUSjQeFQLEKlmksGn9MeAhKyJV
TlKpEhbz259/2Ww31a9W3/JBzkTm2z22881TKcuYx2n+UDKlmD8h+QrJIzGySVp2Ir/z9sfP++/7
Q/XSym7ME54LUJf8rpSTdG4pjEXxJ8IWLHwJ0piJpP02YUkAwjSfkQNIb7xqs/K2j72x+wMoEfNy
BksHuUbD8X0Q+JTPeKJkowdq/VLt9tRyJp/KDFqlgfD1BOrPSYoUATMkRabJJGUixpMy51JPMpdd
nnp1g9k0k8lyzuNMQff6IJw6bb7P0qhIFMsfyKFrrsFG+lnxm1rsv3oHGNdbwBz2h8Vh7y2Wy+1x
c1hvnlpxKOFPS2hQMt9PYSyRjDsTkYJc0T8YQk8l9wtPDjcBhnkogWYPBf8s+T3sDXXWpGG2m8um
fT2l7lBtv2JqfhiISS6/VKsjGE3vsVocjrtqrz/X3RFU66SN87TIJH0KJ9yfZqlIFKqFSnNaoyTw
Bdo66L5InpxHjN76UTQFazHTFiwPaJY0VeVw6a2xTTNQWbCsZZjmeCbgr5glfkcR+2wSfiB6M/tm
N4zBjgkwNDm9+DFXMZjtsj7TNNODDOVZjtDYFPpwpFLck4fydHpgi6a06Iox/Z1JEEPhmk2h+D1J
4VnqWqMYJywK6R3Uk3fQtLlz0OQEfABJYSIlv4u0LEAc9KpZMBOw7nojaGHCgCOW58Kx31Ns+BDT
bUdZeHaXUYu0X+wutxFEPOJBYMODCZtxrc/lySe0m+5fXtwMLEGNrLJq97jdvSw2y8rjf1UbsGcM
jIGPFg3st7GtdT9t96R9/Ic9th3OYtNdqa2wS2cRkTAFcIbWWxmxESEiGRUjWwgySkfO9rCV+Zg3
UMTNFoLziYQEIwdnMKXVrcs4YXkAHtuls0UYAjzIGAwOmgAQCkyn4+CmoYgG2lpLvosAGxEkgby+
IpADQMtRzhSuF0wtwSCLePh1Mufg9ZXlkHLmc8Q0YcTGYLOKLEtziy4Bi00N04AWgpniLI8e4N94
jlpKNlZsBDKJQDMieXtVuy3t4Dz1/bVq0H+22y6r/X6788LWkzUqA759hOckCQRLOrYdKJFQCkYw
RNqqZQXlPqCtD/gS90ow2UMNSE0uP9AqrGnXZ2gXTlpwps+g286izK5bkYKuAlTTSoaurLyZdk5G
n/zHlD4o2K0w6w+ExE1yz+s/YpvnQnGIb9JiTGP3+ShhNA6dN6oFYRNsyjiJ0ZwArOPSYUz0iNGV
q7usi1y0psXVy3b33Vv2YlDLjMkMdKq8pjBHS0RQYcu9oVzRHqghX1K96t1Kw1BydXvxbXRRx6cn
g0BO+WQXcpS+vL1sPsSxhTO11dChGiDOMlAjE+Y1CNE6iLYbCW002UYdlxeUggLh6sOFLQv4cn1B
nwHTC93NLXQz8D9hC13RTGz/BjgL3mjxVL2AM/K2rygMy1iw3J+AGskMDAIiKClAZzuuw9BouxyT
Btk5aidgX+yWX9aHaonTfbeqXqExOUPt3PU0tTmdpOnUOt34/fpqBKoCClGqHibIOdhmOOLGHNdH
o2SZ6PH5kdVnnZXQTcDzKO6DX2oCtkZp0qCIwHAAUil5FGrc3uuT38OkTOLC6juCbgBV+tM5+MYO
UKk9vVkMAsHBURz76ezd58W+WnlfzW6/7raP62cT3rX+8Bxb32n+YBdOyQvEwTLGYPzSwoBGCo54
BUJ0Qm9NDqiUGZyvIkGmOjPQpet8j6Gfo5FttUl1NbaJdWstPP6tWh4Pi8/Plc7QeRrFHTpHeiSS
MFa43/SKDVn6uchoGFVzxEI60jkQOgZFnJGnyjVB20rHZ046ABXVARv4AdQ64IhByphZ2RxjfDOl
haTN5U1PUX0lUho+aOucc/RLrvhiKmNCM5pcWAxTARklEIYE+e3NxZ8fT9aZQwANQFz7z2ncOT0R
h0gW/Rst2Zj2oZ+yNKVjkE+jgjZ6n/QxSOkdhMnh3MB29MOEBlAWWTniiT+JWR/Sd70XsZVWcooP
c0BB9dcago5gt/6rH7r4PuumDFpDvF7WLbz0pDBtHGYClAmPMkeYF/CZirOQXitIIQkYWjxXMkt3
H4o8BmvITYZ0MM1wvXv5e7GrvOftYlXt7PmF8zJKWdCfWy3IfkML9MH+zXU2hT5xp8WNCvgzFzPn
6jUDn+UOI2gYMJtcdwMHI05nVELlFH8gNOQzAZ7KznU5NktLY3Tceyu9+53diycCREpHq3YTSzkT
B3CMFRWIB8q6S0hD+zimIabylSOPDlQ0PgriRLsDExTRJLQF4Ls73zq2P0UnLHk+AxNhzJw9GZB5
7sqsZSxHYzVQvGQGPlgeX1+3u4PtXzvfjfVd75fUDoBmxQ84TTqhkwAakAUoPk4bN5w+RTmjY+17
DInvSxmE3GGMZhlLhMPVXJFr5hwQT+ztrVU3s9WU8s9r//4j7Z+6TU1Svvq22Htisz/sji86GbL/
Aidy5R12i80e+TyAJZW3AgGuX/FHW9D/j9a6OXs+ALbxwmzMwFXWRmC1/XuDhsB72WKS1/tlV/37
uAak7Ikr/9cmrhabA+ClGIT2X96uetYXdoQwZmnmPFrnurDE6U9S2vzbumTCf1+K+os1l0Y7gIg4
zLYVVIN6da/Hw7CrNimYZMVQJyaL3UqLUPyWetiko+MSr1ZoV8di3ley0xypTlsJEtM0Y8L+L5aw
u9RpU4o+3zhDFmlzP9izZuFZLOrrKtrSQ3B8JusFXbvyr0CaumjKh//3Y6j2cEcPLhUbiqFtaKYJ
sVIBTgdvBIYe0ujClU+qwJVPa7XFbnFf09YF0L3je0wTJv1bp8aEda9cTFCrMm/5vF1+teZvjNdG
o+Ns8oCXnXhFBThpnubTEj7pkAoQSZwhKj1sob/KO3ypvMVqtUZnCsGQ7nX/3rZBw8GsyYnEVzkN
H8eZSHtXrm1G59JxfzEHgMBmjssLTUUXR8cWho4JoYg+BpN57EDsasJzwLT0XJnyJ0FKpWGkHNEZ
A0mlpEcAwUn2UQ+bG496fD6sH4+bJe5MYwpWQ2gbh0GJYU0EqIHf+47z2XJNIj+gVRZ5YjwpdKCA
5In4eHN1WWaxw6dOlA9gQgqfznViF1MeZxEdV+gJqI/Xf/7uJMv4wwWtO2x0/+HiQsNZd+sH6Ts0
AMlKlCy+vv5wXyrpszNSUnfx/R80Bji7bZaN4uMicmb7Yx4I1qQ2h1HLbvH6Zb3cU8YryOMBP4Nv
trOoZ2p/NmHGbvFSeZ+Pj49gVoOhdwlH5IrJZgaVL5Zfn9dPXw6AA0DrzrhdoGJVjZQ18KdzB8yf
RngHcYa1Afc/GPkUU/RFaZ3htEgoyF/AmU8nvuheI7QoHOntfYd1oTcqiygbxCMWWWfyMO828YNe
08Ge4jcN/1qLcPqeffm+x5orL1p8Rwc5tBkJgDcc8d7nYkYK8Ew/3TWNWTB22GP1kDlgOTbMUxCe
nAvlKNiJY8f547HEAg6SmHCIh3lA+w+T+xQjCBq6OKk5k2C8wGF16jOUb5SNRjZoLQdhi0lFxGxU
hFYKqtWrh8SHgN9xLWLalRghwy4pEdKerGabcNYvyKj3rze+JYTiPhAyc0WChQPJzkTeBPC0LJBB
pLA7SUHTg4ydoWL114BcR5bL3Xa/fTx4k++v1e7dzHs6VvtDx4qcAofzrNYmKDZ2pebGaRSEQk4I
DfGjKWLoKE2nRTZMoGM+B0Jpu7wvjQFy1Mn1pmjxBRyDrwGVNp1/b3dfbQXBjiYyoBW87RDvUDHQ
j/s71iBkeiAbDWEGup+jNjPRjeT2uOtgjnaCMvf1yJ17ROVnQl2CD9Y1HPThFX6eYtkcIEf18YZ2
KOToVh9MRKOULjoRIJ7C6Tjz6mV7qF532yVlFDEvpTCCp+E/0dh0+vqyfyL7y2LZnAu6x07LnueZ
C+ImUsLcfqmv4FLY2y/r11+9/Wu1XD+eEmMnV8BenrdP8Flu/c70GvdPkE076BACdlezIdX4+t12
sVpuX1ztSLpJMt1nv4W7qtqDq6m8u+1O3Lk6+RGr5l2/j+9dHQxomnh3XDzD1JxzJ+n2fmG15mCz
7vG+6dugz27qauYXpG5QjU/JjX+kBVZcFCNUCnPuSMLdKyco1mW19ElzOIpsPgSgmP5bwiyHuRug
1EW0VmYaLJsjAu/3Y00nw9tNV3JDx4xYF6gAdUREKgCi407JZusM6pw0MpCY1I/LaZowhDRXTi4M
viGg4InPS8D8OU8cEazFF5zrLJRRKSAGie/66LDDFoOLiOBPgJ1nu8vuWXn1RxJjEsKRSLW5cK1O
LpEoGJMP4FuTTehIuhe8+4y+hoh9eo05GyIvtlnttuuVvYksCfJUBOR8GnYLWzHatyT9DJdJDc4x
F7tcb56ouEYqOhw3QlITckpEl1YQhildqsvQkT+SwuErZSRiZzYQy/Hg54T7tKbWFXs09uxew9VX
WGCwzaZ3zOCMRSLAWrQQS5ByV+0sv0eHDjz6Tr1MHWXICKvxJcLUhe2gBzhc+UPmvLsFDsC4wpFI
Dc5gcmFopbMAOGRnWt8VqaI3FsulQ3lTOq4YDdlFDbE8w0Grb4R6ZLM7i+WXXvAviavlBrAZbmNJ
99VxtdX388R2I7pyTUfTwBtEAdhHWmOxONqhjvgXIYbG6gxnZYNSaSIy6F9xR8Fu4igCLhLhpwEt
l47SGwBXLY+79eE7FRhO+YPj+ov7BWokRH1camemwCU5ylRr3pBKMug4palI1Xrqp9lDW3naqcjq
s9HDKQaxuOaJQQrDa/Lm3NSFDe1SmHVxGsn49mcE/XhD9fb74mXxFu+pXtebt/vFYwX9rFdv15tD
9YSye/v59fHnTvHZl8VuVW3QXrZitWtC1pv1Yb14Xv9vU7p3OrFC1XVR/ccomoQvmVA2p+k7bEbD
jFW/Tt5ubUN/Sr0aNmJFJ/TXVyHrFKBhSweHOVp/3i1gzN32eFhvuscaYVPPWDbIRiisTgCTPKwF
BgVMfNCcEO9DcfNplognDdU6qXnQxRgnX442mUUdZggzfV8ohw/K/cuPLkoJkWgg6DIlJAtVlNTF
PNB00bTNfH0FihuFjqv8miESPh89/EE0NZQb11SQheVzcIJnOGA3XNSPzp6dBDq/HomRHsz10M7/
wwHC8LrNIaM23vkEJ4Pa90ZhbCt0skESI3q7Yst80hW/nXIt/B7EVgGiLpSCL8imzZSlxvgZJhOx
nIM+Tjji8V5BpS5/xEwd8uIjIJPo+xGXnxUEC1IxNUQMhiSwPQ1BV351qTkffApEDrjsRLGzgljZ
aWpuzolapbEAvekYvPyu7L/YafUiDDrJbHRAydix4bWdGlidwQvKtLe0hgDjlUxOokBcO4m5kxid
I8aFu1c/zgJBvJdAWnEidv3O8qupPNVfX3fgo77qW9fVS7V/GhYgwl8y1RB1rN83NM7i9ncnx10h
uLq9OVXdcimxunDQw40Nk+JRCkan5HmOL2rJ7XFOtslS4tPqd/qlI4C75de9Zl3WT64p/GIqvfCB
Mg3hE/2uI8ZLef1ckNC0MIfp6sfQt5cXVzddhcv0A2rniyosidUjMEnHXBOOd5tgPhIwB6SimxUA
RkFPhLAwxqtfqya0RzHPttMkeuicQt0LWAMI4uecTZtyTVeW9p8JulOvWOtfUH0+Pj0hSrAqhDp3
w2yMrvhBOuqv6qk6kO1I9p/H9Crxzk6jK9QpzxMeDcXULwS2Ydup3y5gGWNhueKJdIVwpmdkPFOl
qh9QzBNHqKbJWSpkmrhCSTNKOvoXKIUTbNeLBxcWgSYMl99Qzoxg8GmBp56G4PpNreHCFwyDs9Xr
b+aq0tHbYd7RI6ClkI55FjBloBiNeWxPh/msJ6Ir5LuAt93MwQInvfLAupYX+L10+7p/60UQGhxf
zcGYLDZPPQQLERii77SXFaDomG8oePsrGwwR7yvSQt1eWFJNQ136XWQwS/P+wSE2JJaTAtwh/k4G
kml+RxaRnOi6OtaM5kionJPFT9133d1TM3jY7d4HlMKU86yn8CaEwBuZ9pz/sofYTFcKvfVejofq
WwU/VIfl+/fvfx26BOqaqa93+Iz4bAVxPpeu0NwwGFADaBuWcIatzg5pnNTgF7pbnWmCfVdYn+rE
tfO5mfwPwNB/IL9OdF2/oKSHRu8DJq4sEgloF6zA2QI9bW+MvXKctvqtzGpxWHhoyJeDJ121DIVD
GLXl/QFdnjOoOkUmXLfM2uQmZcAUw0gyL4hEXufQOJbUH9XPQX4J/taVYS4Mf8cC6YrwlzfoN9FO
5UCOH2qQZnJusv4NEXdyiOk7vwPCfarB9hgokg9AiO2owiIx2EbPpBOD2dRxzrIJzRM8ANaEAxhq
ar8D8w441mljgGqYBei+JNbxxLBsJnRLRrI4i4jSC/MrhOwdszG7qvb4mzq0/fS3f1W7xVPVycIV
iSPUbjQTYTWEeiL5F3c/ATI5IJKn60zBZ/rprH5MnXV+PUuOv5okNpqD4nFWT4DXdlqes8seZJ1M
PPN/8LljQbxJAAA=
--===============1427824672105104768==--

