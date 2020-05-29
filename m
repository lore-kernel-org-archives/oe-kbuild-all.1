Content-Type: multipart/mixed; boundary="===============1487913932734245999=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mcgrof-next:20200528-sysctl-cleanups 22/36] kernel/printk/printk.c:3019:2: error: implicit declaration of function 'printk_sysctl_init'; did you mean 'printk_late_init'?
Date: Fri, 29 May 2020 21:42:20 +0800
Message-ID: <202005292117.WegCc29G%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1487913932734245999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.g=
it 20200528-sysctl-cleanups
head:   102093c1d4c075c165a83d2b69ecd64507a6cbe1
commit: 785de92ac7a894eb8a4c74d56f94bae9fac13157 [22/36] printk: move print=
k sysctl to printk/sysctl.c
config: m68k-allnoconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 785de92ac7a894eb8a4c74d56f94bae9fac13157
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from kernel/printk/printk.c:61:
kernel/printk/internal.h:64:20: warning: no previous prototype for 'vprintk=
_func' [-Wmissing-prototypes]
64 | __printf(1, 0) int vprintk_func(const char *fmt, va_list args) { retur=
n 0; }
|                    ^~~~~~~~~~~~
kernel/printk/printk.c:175:5: warning: no previous prototype for 'devkmsg_s=
ysctl_set_loglvl' [-Wmissing-prototypes]
175 | int devkmsg_sysctl_set_loglvl(struct ctl_table *table, int write,
|     ^~~~~~~~~~~~~~~~~~~~~~~~~
kernel/printk/printk.c: In function 'printk_late_init':
<< In file included from kernel/printk/printk.c:61:
>> kernel/printk/printk.c:3019:2: error: implicit declaration of function '=
printk_sysctl_init'; did you mean 'printk_late_init'? [-Werror=3Dimplicit-f=
unction-declaration]
3019 |  printk_sysctl_init();
|  ^~~~~~~~~~~~~~~~~~
|  printk_late_init
cc1: some warnings being treated as errors

vim +3019 kernel/printk/printk.c

  2973	=

  2974	/*
  2975	 * Some boot consoles access data that is in the init section and wh=
ich will
  2976	 * be discarded after the initcalls have been run. To make sure that=
 no code
  2977	 * will access this data, unregister the boot consoles in a late ini=
tcall.
  2978	 *
  2979	 * If for some reason, such as deferred probe or the driver being a =
loadable
  2980	 * module, the real console hasn't registered yet at this point, the=
re will
  2981	 * be a brief interval in which no messages are logged to the consol=
e, which
  2982	 * makes it difficult to diagnose problems that occur during this ti=
me.
  2983	 *
  2984	 * To mitigate this problem somewhat, only unregister consoles whose=
 memory
  2985	 * intersects with the init section. Note that all other boot consol=
es will
  2986	 * get unregistred when the real preferred console is registered.
  2987	 */
  2988	static int __init printk_late_init(void)
  2989	{
  2990		struct console *con;
  2991		int ret;
  2992	=

  2993		for_each_console(con) {
  2994			if (!(con->flags & CON_BOOT))
  2995				continue;
  2996	=

  2997			/* Check addresses that might be used for enabled consoles. */
  2998			if (init_section_intersects(con, sizeof(*con)) ||
  2999			    init_section_contains(con->write, 0) ||
  3000			    init_section_contains(con->read, 0) ||
  3001			    init_section_contains(con->device, 0) ||
  3002			    init_section_contains(con->unblank, 0) ||
  3003			    init_section_contains(con->data, 0)) {
  3004				/*
  3005				 * Please, consider moving the reported consoles out
  3006				 * of the init section.
  3007				 */
  3008				pr_warn("bootconsole [%s%d] uses init memory and must be disabled=
 even before the real one is ready\n",
  3009					con->name, con->index);
  3010				unregister_console(con);
  3011			}
  3012		}
  3013		ret =3D cpuhp_setup_state_nocalls(CPUHP_PRINTK_DEAD, "printk:dead",=
 NULL,
  3014						console_cpu_notify);
  3015		WARN_ON(ret < 0);
  3016		ret =3D cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "printk:onli=
ne",
  3017						console_cpu_notify, NULL);
  3018		WARN_ON(ret < 0);
> 3019		printk_sysctl_init();
  3020		return 0;
  3021	}
  3022	late_initcall(printk_late_init);
  3023	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1487913932734245999==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICL0O0V4AAy5jb25maWcAnVzrj9u4rv++f4XRBS52gbY7r75wMB8UW0504tdYcjLTL0aaeKZB
Z5KcPHbb+9dfUrIT2abSnlug21lRT5Iif6To+f233z122K9fZvvlfPb8/MN7qlbVdravFt7j8rn6
lxekXpIqjwdCvYXO0XJ1+P7Xy/uP37x3bz+8vXiznX/wxtV2VT17/nr1uHw6wOjlevXb77/5aRKK
Yen75YTnUqRJqfi9un2Fo98840RvnuZz74+h7//pfXp7/fbilTVGyBIItz+apuFpnttPF9cXFw0h
Co7tV9c3F/rPcZ6IJcMj+cKafsRkyWRcDlOVnhaxCCKJRMKBBCf53Rtqtjx7u2p/2JzONsjTMU9K
OJqMs9M0IhGq5MmkZDnsT8RC3V5fwSzNKmmciYgDO6Tyljtvtd7jxMcDpT6Lmj2/enUaZxNKVqiU
GDwoBDBEskjh0Lox4CErIqX3RTSPUqkSFvPbV3+s1qvqT2tJ+SAnIvPthY60KVP+qLwreMFJeiF5
JAY2SbNS5Hfe7vBl92O3r15OrBzyhOcC5J7flXKUToGbv3vVauGtHztDuiN84MuYT3iiZCMutXyp
tjtqmdHnMoNRaSB8vULdnKRIEUFEH0WTScpIDEdlzmWpRAySafept9/bTbOZLOc8zhRMrzXtOGnT
PkmjIlEsfyCXrnv1GOxnxV9qtvvm7WFdbwZ72O1n+503m8/Xh9V+uXo6sUMJf1zCgJL5fgpriWTY
2ogU5Il+YQm9ldwvPNkXAizzUALNXgr+t+T3IBtFrtie6TRMjM0PPS7I+ddqcXiutt5jNdsfttVO
N9fTEVTrfg7ztMgkyXR/xP1xlopEodRVmtMKI6FfoO+onovsk/OI0ZIdRGO4nBN9X/OA7pKmquwf
/WTH0gw0UnzmZZjmqPLwT8wSv6Vn3W4SfiBmG7EJLwsRXL4/mTgjKnuyGEyJgDuf0wwZchUzOUaL
AlYsojs9yFCe7RGOWOK6pFkqxT15D48XBsQ2ptlZDOl2JoE1hWs3BXg0ksKz1HVGMUxYFNJS1Zt3
0LSFc9CYSMl2kZYFHJo+GwsmAk5Xs5tmWczjActz4ZDqGAc+xPTYQRZSsmyOEw94EPCgZW78y4ub
3k2u4UVWbR/X25fZal55/O9qBeaGwWX20eCAebVv9y+OOC08iQ17S20EXfqDfpspcPq0DsmIDYiD
yqgY2IeUUTpwjgeG50PeeGZ3txBsfyQkGCG4D2n8Cx1HLA/AYdL6I0dFGAIiyRgsDvICoAGmjdaI
mGW6y7QsEjRQgkVgNuh5szwNRdRTwFpMbVDV8Ct+/3FsITLwTQNUlyQQLLHgYO38R1MOHlj1CaB2
YpAzhcwEO0t0kEV8asWbV+KhwKqfWsHvizRLc1XCqU/Nn8Ffl0HMTi2jz7eXJ9iZDRUbADsjUKpI
3l7Z3Ct6+p09z/aop0dwaVq363m12623nvqxqYxjPzEIgK2UwifUzU+jIBR5y87H764u3tPSREpF
TIOE7505rr+75rj55KK8c475cOmkXDkp71yUj651ri8+uChXzjEfXJQb52w37jHOvd3cXH7vq8NR
8HJTzZePy7mXbjCk2p0AVJIGADnlSIQQWdhXBaMXUNqBUKHgUSDbF6mmgqcOxOT9jaW+6OF9BqCl
lFkkrOukwTVakbvby/f1nyNNDxAtRKGbaGNgaINUjXpnjmfzr8tVpVV919yApvF0+lNogfCHXORm
LBXzx7K3RM5ib05HqEBCP3+KD6EBodDtxfebVjg54T6YxXbfMc8THpk27F6vlvZXOwG/tsE+LWrm
aqHitG4kBgjJ0AiVLBN2sNQxJ7YLDU9I2Kja+h9AwOAgZ0/VC/hHb91ndRaTtts5tBUuz7Ygwn01
x1XfLKoNDG4v00CRHCLJ6ytQ2zINw1J1NBPj8TgN6tDXUmo9bsrAcUOQCt4rBzzTRM7doF7rBTgk
pYXYxFz2MrCEmVFm3BehsLIPQCoiuHKAb0sehRq7n6V271aaPZRqlHMWlCqyTpBitC6GsoA1k+C6
R2C+MofpohDDLXRbPVUf+unkzZfZrlp434zgN9v14/LZRH4n93uuW9dH/0SSx/QD4mUZAz64vbQs
neGPI9YBA0Npt86/gChEAkBDWyGR39k5Fk3XHDX0czRy7DQXAA8cg21iPVozj3+v5of97MtzpTNk
nkaY+9aVGYgkjBXEgLnIqASP1jFUybpjGLFWJGU1UxmeExXzS5MMM02ZzkGhhhMTxULSGRwfwteg
iDPyhrsOamxz9bLe/gATTZiOJjiCDUL4cGKs3jF6Lowq2oBKO50yU5rZ4Knk7Sf9xzJDiExzjlis
Aycb2ywApSlwfUULvwHgKmuUWqpcAM6/97mUoJ1NFw6BOsSy2kGO49ZNizhEzOi1SO59ztKUjvE+
DwoHHuY5LgOCUvRtGBZZOeCJP4pZN8qoxeLmvJWu4v2sUFD9vYQ4KNgu/26ipWPU5bN2luFkwwF8
mBGkFzYx04hHmSM+DPhExVlInxW4kAQsAjvsSm/p6QHMxlOWc5Pa7G0zXG5f/pltK+95PVtUW3t/
4RQQPQu6e6sZ2R1oBcY6usEEDH1BjocbFPDfXEycp9cd+CR32D7TAdPA9TSg4XE6oXIwx6gF1Adm
FL4OU9pmui8szY3BYecttPRb0otHAi8LyRt7iKWciXRkCRSt7mlIS5bleI97okwm4MzkYbNZb/e2
o2q1G/Oz3M2pM4Gs4ge01nQGJQE0KwtQJclzzUJaLxEqUoR7DGXvSxmE3GFPr8hzcZ4h5NtZJ2t2
pCnlp2v//j1thNtDTXK7+j7beWK1228PLzqrsfsKerzw9tvZaof9vGfEzQtg0nKDP9rM/H+M1sPZ
8x6AgBdmQwb+oL46i/U/K7w+3ssas6neH9vqP4clIExPXPl/NjBTrPYALmIIV//H21bP+nWJYMYk
zZwKeW4Ki53+KKWNpq0vLWAmguMbj/SlqDtZ22uUAoiIY+xLRw2oD7w57PtTndJySVb01WQ02y40
V8VfqYdDWqot8dWC9hks5l29O+6RmvTEVGKbZk1QidkcBE5dMqXorDXuELws2s2eGJuDZ7EoTQqX
Npmj6bmMFkwN0MFFGrtoyoe/jjimf1Ir+NI7AdhQgIHGiLPvTYy4r3xSylc+rctWd6v3NW1TAAA7
2mOaMOq+2TRWN+sHxZnKvPnzev7N2r8xWSsN/LLRAz7h4QMPYIppmo9LaNJRB3jvOEMotl/DfJW3
/1p5s8ViiY4H4gU96+6tbXn6i1mbE4mvcirKrcEyxlAgBhDHMBNpObLyefD/sMleQxkyqSBSGtUv
sO8ur2x1Qc+LPfu5CAOwXmabDRgZ3WXRB016F8GUZXQuV5Mbn50B8MXnF3fPePDxvfxAPyXoDsb1
uOksDsrQH9HGz30gc+AwMK3V9w1IupNLJ6jdtYfDnA+dCWNzQAD2jmewKZ0HzNIp4CE2cTzlaCrg
Kk6ngQxdFlkW0cZqNI3ThLYWI55DAEvvFZ+8g5SKP6Qc4AuUFIOolXuFdiqI82NGdkdCXyUPz/vl
42E1x8vVGGxCKUFWEFeBiWL0mRXmSKTwr2kUB6PHPM4iGszpydX760+ODCiQZfzugpYmG9y/u7jQ
eNo9+kH6DpkgWQnQ8uvrd/elkj4LaGupO97F9x9pOHWWkZbh58Micr+A8ECw0ue+1q+e4231InqY
4Go723xdzneU3wjalsKgL2izXXF9HrvZREPb2UvlfTk8PoJHC/q+OxyQfCGHmeBhNv/2vHz6ugfg
FfnBGVAD1FI/S9TxCZ3tYf44wgebM12bGOQnKx9Dny4rrbuXFklA3L4C7mo68gV4BqUi3ntcQnot
OftuYnMRZUTYZHWAH5OeY7Hox+TPyA86k/ekjm0akZ/u+rE9+/pjhzVbXjT7geilbw0SwNO44r3P
xcS5X22eJy7cfWalzjQsGDpssXrIHPESDsxTEICcCtX1Xs09ih03nccSq1dIYsIh9OcBLSXmYwZI
DMClOpBsrnyjnzTURBPbCx9NkiVmgyKk0ujyIfHLUDhKF8y4EmN/EJsSIb2vutuIs251Si2uzvrW
mYv7QMjMVXCik2cmBUGfGTugG+dJQdODjPY5Eywu642rg/j5dr1bP+690Y9NtX0z8Z4O1W7fsi3H
+O18V4vPig1dBQ9D/TQqR8TNNAAzGnfS9hHgGv+hJljYAbPS3by1kbbGt3J92HY8dBNuUHRLqZmI
Bul9b9ocINy+2mzXc+qiY9JIYaKAjjeIwWbSzcvuiZwvi2UjcnrG1kgTPMPif0hdneWlKwirlps/
vV3zgBm07Rd7eV4/QbNc+xSTKLIZBxMChHUN61ONC9uuZ4v5+sU1jqSbhNR99le4raodWL/Ku1tv
xZ1rkp911X2Xb+N71wQ9mibeHWbPsDXn3km67QB9wE09dbrHR57vvTnbaa6JX5DCpwYfMyK/pAUW
TI8RAeDrMp2wu1dORAg676iLFI48STbt4ypMFc5hl5TR6dGsJTLAMU4YoMMSBAIKnFtEJAwghm6V
RZ4sVBMxjhyFgX5cjtOEoee8cvbCED27Z+XVxyTGdADtQFu9cD5S2u2tdgIsn9EhXezTUXHO+i6T
rRbb9XJhc4ElQZ6KgNxP091yioyOi5Nursgk2aaY6JwvV08UhpWKDtJFonhUKjq+Jqa0ADfmS8n8
jUjpfctIxM78GRanIcLkPo216vo1Ghy0X4Dq1xOwVka4LRswYZEIsHgqlOZZnQ6FQimSkL5t/B7h
MwzXD7xl6qinRUiEhe1jl9OGGXji5w8ZvoO7egBucWG54AyeEoZWOqtWQ3ZmdIy8NnBN+Ay353hP
GPxCp7siVbSiYBFxKG9KxyuaIbuoIZYkOGgANnMAhB2y0YLZ/GsncJTEQ2gDakxvY9p21WGx1i/G
hFohRnFtR9P8kYiCnNOC1uXBDrXHfwg2NFasvytLjkIaaA7zK+4oZk0cBbJFIvw0oPnSulwGJVXz
w3a5/0FFCGP+4NAf7heo3gD/udTeRYGPcBSH1n3bfLAhbVMHqpVel6Uc6z1bGLfbjV5OgUr7uk8M
XOi/BDeXsP7S5HQUZhXXRDK+fYXAGJ+TXv+Yvcxe46PSZrl6vZs9VjDPcvF6udpXT8i71182j69a
ZU1fZ9tFtUL7e2Krncpdrpb75ex5+b+dui/9mY4umuh9gaFJ+JUN8ua4fYcBajpjra2zbzsZ291S
p3KZONERYnVVyLoFaCX7Ce1o+WU7gzW368N+uWpfa8QxLsvrp3kgqBLTI0rxRSnSViHH8Sueutna
G1xuXyiH28r9S7pAFcepy4tA0E/JSBaqKJ3TXtO1pEB5f+OiOAl05jMSA72Q40049z86wBC+Ll1f
waWIwu6nYCcw/hk0ihICppCAy3aBDTa1qpKPuSadfcBaQfzKwyQvbOHUVYTmVeSMwMFIxMLXhaMn
5c/vSvfHDgq/PnCcsFbonnq2r/b8mylb062bLZiBb/o9avFS7Z76VUfwj0w1pBjq6uvmPt5+cPa4
KwRXtzfHYj4uJRYb9Wa4sT1RPEgj4AjPc/xyjjyYc7PmAq5fNuAf3ugvqMB/zr/tdNe5ad9SLsK8
WrkhV6KrzmN8rtTfKRGiDHPYbjlleXJ7eXF10xZVpistnR90YD2dXgF60Q8MHB8fQC8TsKrkVx/m
BOAGEAmh543xRcUqBOtQ9E7BlkYPts6ZQ+ivsM6W3oC2+3BYzsZNhReNX35VFK26qFpDg+rL4ekJ
TbVVU9F6lGFDUBTAFo6qlHqrDngxkIx2JL+0jTbb++XFpr1bH2j7zuO8ba8B9wOCc55IFyg3M2NH
7UJpxIfTgBRlmrh8kJkmHfwb9OJcDZXx4gVeXNoQ6e/xTC+eBP3r0Zlv4qoyQKKpKsz50Inma77q
HIWGB8RVqMuSxwwk3FjY00Uwzaai87IHH05S6TFi1Kl+qov/oL+Xrje7114EQOuwMRo+mq2eOngA
8CximbQTsFF0jBILqxTeELE4IC0UNFtpqFCXdhYZ7NLUXzvYhsRyVIDPUEzSAprekc+wp+cGLKeL
iPfmYxh8jhe/tb8dbat/7+NRtxyQC2POs45iG0CGOeDThf1jB0hXl0u89l4O++p7BT9U+/nbt2//
7Ft/KvXc1Tv8LPFsyWE+la5Ax3Qwnr6UERzhTLc6cNfgoXHy9LQ6CQByV1h+50Q706nZ/E8Qw3/B
P2tu9CRgjCBkk5wHYA7OVhppg2kMjyuUMp3gLwTSg1QeC8mMhtU19YvZfuahRZ6fPkJu81A4mFGb
0J/Q5TnDafIOrkcdbVoTiMUUQ7CfF0SOpXVpHEfqrurnwN4ES66Jz3D8gvYp+P03fqbsVg7s8VMN
wk45D39lqpw5Hqn1p+h3sg+HW1+ju+8+WCiDPHICczQmkcVZRLwg6l+tQTKovpgiMJ9qP3weOD6B
wkq1jLmKWPFjZuJgjV6L4ch8tOn8RQgGRZSxQ/EGQVwGQiJOJFnXOaAN9lW1w18doK2xv/672s6e
Wh8+jouOJ7W2ZfQc8TgwRyT/NjjSkdQzvwuD6NN2zeCB/XRiFAWC3dZ3Wfi7EmKjh2gAnQ+jgAGc
duzcsS1/NsXPd2uuDzhYHtF1n93kgYmZ/g/uByj/3UUAAA==
--===============1487913932734245999==--

