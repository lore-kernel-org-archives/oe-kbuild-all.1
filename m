Content-Type: multipart/mixed; boundary="===============8825514644535942271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [sashal-linux-stable:queue-4.4 3/3] kernel/ptrace.c:137:25: warning: comparison of integer expressions of different signedness: 'pid_t' {aka 'int'} and 'long unsigned int'
Date: Mon, 24 May 2021 04:02:34 +0800
Message-ID: <202105240432.0PkPGrwh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8825514644535942271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git queue-4.4
head:   3667f03d0cf74926d5ca45d1ba6dc8100dd5e773
commit: 3667f03d0cf74926d5ca45d1ba6dc8100dd5e773 [3/3] ptrace: make ptrace(=
) fail if the tracee changed its pid unexpectedly
config: mips-rt305x_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3D3667f03d0cf74926d5ca45d1ba6dc8100dd5e773
        git remote add sashal-linux-stable https://git.kernel.org/pub/scm/l=
inux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-linux-stable queue-4.4
        git checkout 3667f03d0cf74926d5ca45d1ba6dc8100dd5e773
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/ptrace.c:16:
   include/linux/pagemap.h: In function 'fault_in_multipages_readable':
   include/linux/pagemap.h:632:16: warning: variable 'c' set but not used [=
-Wunused-but-set-variable]
     632 |  volatile char c;
         |                ^
   In file included from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/uapi/linux/timex.h:56,
                    from include/linux/timex.h:56,
                    from include/linux/sched.h:19,
                    from kernel/ptrace.c:12:
   include/linux/regset.h: In function 'user_regset_copyout':
   include/linux/regset.h:227:14: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     227 |  BUG_ON(*pos < start_pos);
         |              ^
   arch/mips/include/asm/bug.h:33:44: note: in definition of macro 'BUG_ON'
      33 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   In file included from kernel/ptrace.c:25:
   include/linux/regset.h:228:26: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     228 |  if (end_pos < 0 || *pos < end_pos) {
         |                          ^
   In file included from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/uapi/linux/timex.h:56,
                    from include/linux/timex.h:56,
                    from include/linux/sched.h:19,
                    from kernel/ptrace.c:12:
   include/linux/regset.h: In function 'user_regset_copyin':
   include/linux/regset.h:252:14: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     252 |  BUG_ON(*pos < start_pos);
         |              ^
   arch/mips/include/asm/bug.h:33:44: note: in definition of macro 'BUG_ON'
      33 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   In file included from kernel/ptrace.c:25:
   include/linux/regset.h:253:26: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     253 |  if (end_pos < 0 || *pos < end_pos) {
         |                          ^
   In file included from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/uapi/linux/timex.h:56,
                    from include/linux/timex.h:56,
                    from include/linux/sched.h:19,
                    from kernel/ptrace.c:12:
   include/linux/regset.h: In function 'user_regset_copyout_zero':
   include/linux/regset.h:282:14: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     282 |  BUG_ON(*pos < start_pos);
         |              ^
   arch/mips/include/asm/bug.h:33:44: note: in definition of macro 'BUG_ON'
      33 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   In file included from kernel/ptrace.c:25:
   include/linux/regset.h:283:26: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     283 |  if (end_pos < 0 || *pos < end_pos) {
         |                          ^
   In file included from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/preempt.h:4,
                    from arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:59,
                    from include/linux/spinlock.h:50,
                    from include/linux/seqlock.h:35,
                    from include/linux/time.h:5,
                    from include/uapi/linux/timex.h:56,
                    from include/linux/timex.h:56,
                    from include/linux/sched.h:19,
                    from kernel/ptrace.c:12:
   include/linux/regset.h: In function 'user_regset_copyin_ignore':
   include/linux/regset.h:308:14: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     308 |  BUG_ON(*pos < start_pos);
         |              ^
   arch/mips/include/asm/bug.h:33:44: note: in definition of macro 'BUG_ON'
      33 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   In file included from kernel/ptrace.c:25:
   include/linux/regset.h:309:26: warning: comparison of integer expression=
s of different signedness: 'unsigned int' and 'int' [-Wsign-compare]
     309 |  if (end_pos < 0 || *pos < end_pos) {
         |                          ^
   kernel/ptrace.c: In function 'looks_like_a_spurious_pid':
>> kernel/ptrace.c:137:25: warning: comparison of integer expressions of di=
fferent signedness: 'pid_t' {aka 'int'} and 'long unsigned int' [-Wsign-com=
pare]
     137 |  if (task_pid_vnr(task) =3D=3D task->ptrace_message)
         |                         ^~
   kernel/ptrace.c: In function 'ptrace_readdata':
   kernel/ptrace.c:577:19: warning: comparison of integer expressions of di=
fferent signedness: 'int' and 'unsigned int' [-Wsign-compare]
     577 |   this_len =3D (len > sizeof(buf)) ? sizeof(buf) : len;
         |                   ^
   kernel/ptrace.c:577:50: warning: operand of ?: changes signedness from '=
int' to 'unsigned int' due to unsignedness of other operand [-Wsign-compare]
     577 |   this_len =3D (len > sizeof(buf)) ? sizeof(buf) : len;
         |                                                  ^~~
   kernel/ptrace.c: In function 'ptrace_writedata':
   kernel/ptrace.c:602:19: warning: comparison of integer expressions of di=
fferent signedness: 'int' and 'unsigned int' [-Wsign-compare]
     602 |   this_len =3D (len > sizeof(buf)) ? sizeof(buf) : len;
         |                   ^
   kernel/ptrace.c:602:50: warning: operand of ?: changes signedness from '=
int' to 'unsigned int' due to unsignedness of other operand [-Wsign-compare]
     602 |   this_len =3D (len > sizeof(buf)) ? sizeof(buf) : len;
         |                                                  ^~~
   kernel/ptrace.c: In function 'find_regset':
   kernel/ptrace.c:846:16: warning: comparison of integer expressions of di=
fferent signedness: 'int' and 'unsigned int' [-Wsign-compare]
     846 |  for (n =3D 0; n < view->n; ++n) {
         |                ^


vim +137 kernel/ptrace.c

   131	=

   132	static bool looks_like_a_spurious_pid(struct task_struct *task)
   133	{
   134		if (task->exit_code !=3D ((PTRACE_EVENT_EXEC << 8) | SIGTRAP))
   135			return false;
   136	=

 > 137		if (task_pid_vnr(task) =3D=3D task->ptrace_message)
   138			return false;
   139		/*
   140		 * The tracee changed its pid but the PTRACE_EVENT_EXEC event
   141		 * was not wait()'ed, most probably debugger targets the old
   142		 * leader which was destroyed in de_thread().
   143		 */
   144		return true;
   145	}
   146	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8825514644535942271==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICCCsqmAAAy5jb25maWcAlFxbc9s4sn6fX6HKnDq1W7UziWXHkzmn/ACCoIQRSTAAKMt+YSm2
JuMaX1KWPLv599sNkhJBNijNQ2Ib/eHe6Bsa/PGHHyfsbffytN493K0fH79Pvm6eN6/r3eZ+8vvD
4+b/J7Ga5MpORCztzwBOH57f/vP+6eHbdnLx88XP08tfJ4vN6/PmccJfnn9/+PoGdR9enn/48Qeu
8kTOqkwW5ur7D1Dw4yRb3/3x8LyZbDePm7sG9uOkA6xYyuciu5k8bCfPLzsA7g4Apn+hy+18+jFE
+eVXkhK53mYiF1pyGsGzi19WqxDt8jxAcw1zFbHU0nTG51UsuLHMSpWHMb+x29swVeYw+MDQU5Zb
+TlAMmxkXKlS+cyo/Hx6HHN5EcYUEqbH51KFISuZJsWMhdcwgxUcIRvB4nOSnAsOlfVCyNyE+1/q
i7PAFuarojI2mk4/jJNppisy6N4UXVpD0SyV+QIOwx5rZrKSxZRe7YZIM31D/DRCDGyikdGNFRXX
c5mLUQTTmUiPtKHG2zgKMNfQyxggldamwpR6tBWRW2VobmkgkZwFG8llFRiEYxW7Ov81dNpr+kWQ
LhdaWbmodPQxsB+cLWWZVYpbofLKKPpM52lWrVJdRYrpeARRjCDcuSmYhg61JfiTpwuxtJW25+cf
p8CmHttWMk0rxrnHvooDevrp04porSaef/i4GlY5//SJPrtIzuwvl4GjF9sIald5j6k8KvZYiSVL
OzO4NiJrpX1lCpmninsHkWnYxzkzMEs1m1ZlYK/6MF8GNqC2n/m1kLO5PQyjJXBY0EgzYMpYpOzm
ADCg/OJKZdJWiWaZqAolcyv0AREpBRvErg8l3G3ZxaJTYjT3S2qdhHOulubGQP/pYPJxxioWx7qy
1eVFJCn+cDhTFoXS1lRloVUkzKEXbAF2hqu50HAeD4RcwKyQmjGUnDDxzpRvjFtQwXR6UxUa5utt
TKMKeFBY5aqSCkeErVNMXZSNDKlEHkuW+33vp9PH+COYlzNR2TRq8URHtVYqYN96C5+ewY7DzlZm
LhN79bG2hWBctB2EA8Z659NKnwUm1NKnw4X0qo+TO7UPxcOyfi/7JTufAp9UC6FzkfrVjkDmIKFA
7ovqmlk+d0y+txEba3L3/dvmYES6ZrqbsljCeS6FoTaiYLBXRt6K6mIRdSsdCGeXi4hW3nvI5YUP
aQCJ0lwAq62qWxBCSsdwOs/OunPHVS60SARMzV+V9vzHZVYgM/lUOLFVUpTDwpp5Bng8VQbZ34Cx
Yx2nKQ0bxrVqbO7eoMxNzgPbNAdBlYkssM/Y3NlloGpm2IHiJESSMguNwVFiUdo56k25XwATiGE9
AQ7Ht8shS1caNYKaKm6qdqvVkkyChNNxt/p+f10DKESxR5knyjVCaa8CBEJVWNcRTNhcXXSOqMoK
xoPmezGH1TsiS5F7nEyERZhdfWiLUTNXVlVRaTx2Nxml70TCyhQEH8rVTOauz6uLD79eepK3ENpt
2SLrNslTwXLHWuQcEq3gUF77IvVQOaNtrdtCKdpivI1K2ii5BfZN04DVI2MQye5MWs34ApweEja/
raa0NwKUi0/E0kH52YcPHmdAScCcxuY/0gaJI12GSNBFsNrZhyllPHgHj2mUnvPbzgG4vYJGfXth
rq3sHhIQPiIraivJE39N+VKlZW6Zpr3sBkXSFmIl6I3impm5E2y0WSc4npmwVapAHyXF5cWIfi2N
qFTSMYVKmVpgerD6egoXZCIrCtDkaHZYTwU4ukgTDxAeFlhaQaRnW2Ux2MgCT01GdtkC0EQVKwsN
jgQPuo2hrEoVAzVD9I3CKRZFu2gd8Q3e9wKPjBjSnAgEyStyfmMVUbmYWRTcVSqWIjVX0464afsF
9/7q3fvHhy/vn17u3x432/f/U+ZosGoBYsWI9z/fuWjQu7au1J+ra6UX/vbFVkIdWA/Xn6lH4ayA
mYtCPeJk374d7IBIq4XIK/STso7YlzkcE5Ev4cDg4MB+vjrfDxv0oTFOZEvQRu/e+WIcyipL2xGw
uixdCm1Aznv1uoSKlVaNyOa5MhZX5urdP55fnjf/3K8IylZP3y5lwQcF+JNbz1ovlJGrKvtcipIW
3fWEQcEpfVMxi4EYWsTPWQ7ylT5q4KF4LkIZ+2rM7RLs6mT79mX7fbvbPB12qbVzcNOdkzB0gZBk
5uqapoC1391dKIlVxqRnlh9KYa2jckZMAyHOXosrO9eCxaA/eraCc4qMKtGoi5llw/E4Fu14TX1f
DhuAg1JbsH1iptBPimuPxy2ZfXjavG6pVUMhDpwtYFm6p/UW9bdUsfQ8bxBxQJG97fPJlNoDOw/O
qHGz0nubG6yD93a9/XOyg9FN1s/3k+1uvdtO1nd3L2/Pu4fnr71hojnBQKSDHqnXdN+zM2B8Mi4H
rd1hf9zyHrB0uNXEyEdcAFsDlNZNlpkF+pZmwKWalxNDrXd+UwGtO3r4E8QRLDglD0wP7HrEKuR4
sCkYT5qimMkClqIFZeuQTlYH28EhwfmrLVd6iVCaVpHMpwFDalH/Qoo5rJ403unZL30mro0M3rek
+UyrsqADrFCDL5xbh8xmlQ5wKchFA4a0oFupO0b56rqiMTcmMSAAwGrhcMporaoxykLMPEoXUHXp
1IeOfXUCbjw0XEsGT/iDYzG7lWR4FzYAKN3IWVyltxnzCla3Pbrq/X3hrTKvVAFnBD1SEGUoC+BH
BpY7Jbf7aHRkPZVSq5JWAIKBCHMF/8f0QcBxXBTo4NSc2VHbRccEq49Kx/oCjSdBeXQCVmYmbAYH
pRpI0HrriHBUM4SGQkxzAcXmJuuMui2pvB720aT9IemI/wjMlCopu/iktGLVmV2hvPHKWc7SpMMn
Toh2C5wecAWHg1kkIzMxjdd90LOSMiZYvJQw2qYdzzPE1XaWRhITFdEFZlrL7o5AkYjBnu1ZhMhZ
VV+RuUI0vJe1k9YL0hSb199fXp/Wz3ebifhr8wwqg4Hy4Kg0QMt1o1qd5skzusxqauU0Aegm+rin
ZTRU975fbsFKXARqM8qCx0Y9/ksV7RLA+luROTuhAvNPJpKH7/BAYSUy7am07oKrGuG5aIs6pko2
+BtGjWAGgSuZcqSq689FIuCAABujWOWoTkNBXtzy1r+KfEvVtbXox37rUi0sSXBtOkEyV6ofznGB
Z2t1vxKWw99WzkpVEsYVeAB1fKC27Xq1eUr2U8iafagBHha4ZyReM+BLNMYLpvEsNC4B0UTj51aw
r17Yvh4Sr/0yWCIrOGjFnqD3ibR49zEDF3+I0GJWpoy+9xqijdUqzLG4G+Cs7WMxvfkFTL8eijD6
+vE9FTerWQiOh6yjYFRcpmC+In+iF6/9qHLTvFgBo6NuQycDJ9jbT3ffgLXB/1GZpyPBzAHPO4I6
10zHewN5xtXypy/r7eZ+8mct+r69vvz+8FhbxvsFRVgT7B6/PnLA5vxXtGpws9lHjN1Z6N+r4J0H
qqzueXNqzYXUDkHFZtW8oIQraqLZGF+glEeNKXOkByvXZDqaoeLmrATu4et2wK7eO9MpvXAtUtJy
vyHj0dO0VOvFkdMoZomnphtTMDIBF+RAB894FII3djMtLR1eQ1Qb4HHixDuajpmK9evuAW+FJvb7
t8324LEA3kpnlIFBgCagtyuMK50fMDQDytURhDLJsTYyOWPHMJZpeQSTMU4jWrqJlTkgvN0ChzCW
ZhHWhhnY8KvKlNH4GIwC2ShNtfp0eWS0JbTnrqzG+03j7EhDmJtxpKvU6qP7ZMpje71g4CeMrrBI
JL2+GHy6/HSk/Q4XD1F1eEhNzN0fGwwQvnbYWKras8uV6kZ5mtIYdDm268V6GhpPPhPTaENtVM2W
hn2NVG06uHp3v1nfg1TfHAKXuZsk5gw4UccXqFa6vqKjowXS0MdoZN1rja59oHKX2NTu3NEIcUsI
kOhtO3n5hhJkO/lHweW/JgXPuGT/mghp4H/3n+X/7CTpZV5ko+C8l0Pi2hX/2dy97dZfHjcuN3Di
bP9dZ2cjmSeZRd3a07gHQv/+H4pAbnUdzBpquJaFd+VbW1mqDARA6mqZNIELCuikfz3RunEa9qf2
7vYKv3j59+Z1Ap7N+uvmCRybdj0Pc611uYxA2zsnAOOyRnoXnk2+hMH7gy65c4gdjbbZD03T/kU2
2B9MKagHnu0HDoQ9Td4/bvqZBsEQoht8fcfc4tA3K1JB2Qq58PI9LOYnoipu1zPf7P798von2EvD
lSzA2hLeVtclIGoZZYuiKPZcYBT1feyeukp05rxkOgQlMDuBCg5Jb0qyqIMbnBm/tNXElQbOFJ5J
L9EPiIC9pKgGkcleuwX6MXgLYrzWXaMNgtk5QQPLKVJG9Potcjpc5namkGPEGeo4kZWB1EiHqWyZ
92zcznzcwPyl686jO1NvzDIzWbU8I/s90KdEr+YmB95UC+k3ioMtY2q0HiRRdAQXOaBi9N2JowlD
L6SsVyl44+noji9HRuZAx+iukQzTIECI5aZ/cxoEn9xsJMRIi6mmE3wdMXB6LS/QkZyRNuyeGEk+
VpeXkX8fsqdcC2OvlaJl6h41h9+OIMxxyE2U0mkQe8hSzBjt++whGNLD4zCOSo+MZSlyeiv2iBsR
YOU9QqZgcSh5ZLwxP7owPKY2vrW1BnvXEnRvDj1y2/zVu7u3Lw937/yOs/hjyDuUxZLO0AAuxTtp
jNpgvnhQQBQWek4Z6O+Edurahor5jYttgLTPCjr0B9B9cKhbvy4MXmUeENSxibSMZ+IAGloGL68b
1MFgtu3APAg81Th0ctDexBjhN5cQHLyKG0LDl9VDbKrIBUhw83MXerp66pTi9VV9wwbFh2Y78Cq8
uV0UZmRRKtoD4TVk4q9LlzwS4PZwyCQhS3YAdNwUhFock1VwLgPHsgsy3B4HgcpMwek4PjiWsTxm
x5YssUVwZ+bn0/Nj9aXmwfrAMxH4blUgwORhTT6yiocNLkZW6NAWC2Uje6iQoeXtcDK6Jc2pOI44
xlO1zTUqWlaNXfZUC42Vc/W2k7uXpy/gEt9PmlyfrgvRrTxyzroonHof6fW3W79+3ezC3VimZyCV
3SWzKel3G2SFIyJ8WIEY6RjcenxKIGITOqMEeB60WIfQ01a+QaMr564uT64R9PmGSDU7tgh/a6x5
0lMHR9CnKJoOXrkzeDIe32z0csVG8YA+HQvCd3U6bw4SRsawvMiMObYvgFKFNeCuFsGj+bTe3f0x
KgEsn7s0ZHtTnDD3Gh8VyalQnpbGkrmQFBjMArwwCU28ReU5vhALqBC6QjgCHKqAWYl/p8IpgueA
bu2i0VYL2s8loGFjgsCKZTg/h8KfJARrrOB08IuCBpxxAjpnZv639mMu0uIUcdmgT2aMkRgBiQYf
f3byqUqnIcOCwIp8ZuensVudX/s0gsgYP8KKpzN3HTPCzODxFvPkBHdkj1bX+en7WSzs35Fmn0sV
eLdMgE/WKA1csPQEg6cFc5B+p6LDrgGBxZxXKkWSwrp4//jmubfwxsrA01eqgg4lixLoWv+djAbT
6FRs6J2oLCoTCpwV1XKYoyqL/zvBP08wGKKZC2lceF5wx12qSQHvBtzXJksq5CfEZeHaCNHR32aa
ukdpiIOxafGb4JYaWM7soK/DMgFAFnuXpLuAQGksjUB0tgMJqZAuRhfDuAkJtDYQ9AZEE9Z58ktb
y9GtwXAaDdnc5GHzr0bmjDpw7eDyWSqCrTdGU8Ab9aDjq9VaiiOrgG+TB+MAfhm6n4PoVVKJaAQG
TQXNEjxvIfml40BEE7QvSWCWFrF9hdoUG9u5xa7nQsTm5CyDMeI1dDDLvQYuU5Y3vDSSPOgC7O7l
pRepjA0VjnFNfvowPfNujw+l1Wyp6bXrYLIQJgaeIZVBmnphXvgzJCzpuyZmWUr7ZqvApzdSVgSe
9eJnKALyWAiBM/xISSFc0zozoLnH/Py2eds8PH993yQ29BLAGnzFI/rzKy19Hnh0tqcngWvsFlDo
wLdVWoCzm8YHoQPp8i3dJOODNMl4+1Z8Dl+6OUAU9PscfXZshLEZjdsbd4NtRdBiqhvR4atht5Kf
jy42n6tF0GZwiM9H1oqreOSGEhHJ55NA42w1H1/wQo7Pokj9y4ma9R/X2+3D7w936/6XDHKnewzm
JIZNO4ewXOaxCF85I8bdIQfMkgaSXI+SQ9bavgezDN+Mt4DgVVI9glSNj2Ek1rFvYCRXQTg7ZLQF
xgOWec0hMlHe5RsPZDOCFmQu0ZAkq0LkS3MtQ4NZ1i5C0Oh2EetgzkZWpIFEdjNyVt1oYkEP2F1X
n4OlZOprtmVgjfQK397fVP7bj+iz90IFH3X8RryHbLJcJrvNdkdoBnAke0/h9io90yyWap99tL77
c7Ob6PX9wwtmGu9e7l4evagbC6lAzkJv7WLaKY1otcjAlFvpgrqFx6QWXXqpKtcSH/76F4Y8maFe
pfM5UhkNiPX82lrPm839drJ7mXzZTDbPGH68x4SzSca4A3SS15oSdCNdbMd9nsO9ffpw6PFaQilt
ICYLGcg7xl37NfAJBCbpk8xFgUGSgO5MAp9sux7JyYiNrQZfauhagw0/tuwTb/56uNtM4teHv+rE
y8OT6oe7pnii+mlYZf3+po51HbbWK65cFtK799svD8/v/3jZfXt8+9q5iIdjZbMioW6ZYG/ymKX1
e4XWKtN124nUmcutda8YO++xrqv66buX9NiCZU6k2jcgsQJ/dw/13u/tG3VJYe28EpamUe8qoD0J
KYhkl9nd5hD6yQtRCf9ruQxI7QYgljr0zBG/zHMDg1hKo+g29u+JixJbkqEXk/hMwMxhxjG+6EwC
qaH3jj08cRJpnhkbVTNpIvzqBC2V3ccJ4ow2p+BHHnq4kln//YCN3Zv7wKsAoMIM3JeuMLeY4ibE
dPOPO6IISSrZl3rNMv3LsEm3DuUWsybr+033hs2+rp+3j86kmaTr714CMzYVpQvYiV6/g8/NJDYg
V0IEGaToJA42Z0wS03LFZMFKbqFU4AUvEoNff0HiPusbeK1WqoM11Sx7r1X2PgED8Y/J3R8P3yb3
e5HU3chE9jfqNwFepXtKFth8OBH7Twt4NaExNFrcO9jeu5MOCj+YEzEwQa5lbOfVmb+NPep0lHrR
H0GPTn9ShhoEbVkSyHMqB7KdvOxNxpVNqWWSgQ94tuTwyB05t6DyV+SX0Np9yEBzDU4+UkAbUIGK
llxamfarATeFxYUK01hkelHw5lO0375hNnLDkc60cCy6vgPZ2OdQBRapWOE+YPimd+rxc0/1V6j8
E1IXE+FWAqSSQfWU2bE5p/ur1sHczObx95/uXp53a5e2AehG5nfOn9cWvmhNUrCcQsdl+rH49KE/
QmPs9GNYtph0bPjFfIwK/8bITs5OcV79qccP2z9/Us8/cdzKgR3kT1rxGf0RSqTmLPSJHhSbuejT
Xetpgdvxv/XPKb66mDxtnl5ev4cWvq5AL7opZJUr7fNaU+geQF64zEXQuAM9V0aSaDS2nZeUPsOB
wixzaQMfwgEqfqoNP1bRbaD5ZiNJQr6s/YFDmff2Bf7Ouwn28HdWe0CdAl94QIkCK4v+loN7rpDh
9zab5+zucVnzYaNDHLAuIuo3r/eoN4F5mab4B+0+NSAONuLIhz5aWNp7hzQAxDqi+W4/miP00Lnh
MX5OClxQHi/pFvBZOy5wJSzt1LddzI+MIBqejP8ydm3NaSPB+q9Q5ymp2uwafMPn1D4MkgAtulkj
GZwXFcEkpmIbF+Dazb8/3T0SaKRukYfEtvqb0Wiu3T19CTf7Fcd4wt4MTC9G39SXwcPFQGiZez24
XhRuIkQ/AaY8fMT5xVK9yAlinacYJjiVmefMh33Qub3u80qiUZhcDK9xAfICHCwCqLoAtuWyMM94
hkwcn0FzZhqfKy/B023/8f6+3R3qXWcoMGq2JsCm3l06i5v6hczx+WJxddN6W7b+b7nv+W/7w+7j
leI57J+XOzhDDsgOYwt66B3Xe4Lh3Lzjr9JgNjuKcApvN5c9ivv9fbN7/Rfq7j1t/3172S4r88JK
XPXfDuuXXug7JLOYPbyiaQdk7/bjU5Hpdn8Qic5y98RVKOK377stMgXAIujD8rCuuVf1PjmxDj9z
Z4znTHmtsbMIyE1bJBqxFoMViBDP485q4wHv2t5AdnjL8nO1X7EEp5lVjSIQ0fmjXkmqfNcEaeBE
eyhw2repuBtaV1P0rMuS1bzzvrL1F15irq/HR6cy+oyy/RQwtvcJJubPP3qH5fv6j57jfoGpXvNy
rDYobX2bM03NU35vqcixFgDHWoUgC1X1QsiSiiwoUum74XfUnwgCM0GCeDKRbhYJoB1U52IMWH46
ZNUKt/dnKgpMR2vwbcjYOYfw6f8zIK3070ACf6QFvxqDSZPO2Qq9NafohtZCIYrk3GKopJSgwEXy
y/Oxnjr8OWbWhhi+xpA75kGsXQpO5atM0BQpKWWC4BBVGTqngi1pqW2yfTtLh93TCogjV5p7dDTz
x/J9rgL/a8dlR+ZJMoBy8GaapT0sJApUiQsplmLmeRkq/cXWIJFCoKTwi9DqLBfivOVR8UBdR7EZ
hRY8SIxXFISMez1poE8H85Ot7gVJ6LDbfPvATC76381h9dxTO5BwD+vV4WPHioKlBUERPgyH3s1C
yo7RRBUmyrBtXVoNcjbFw8xiwhXaNqgi08KcQ2c2F2QcYOmtYqmD11/yRWJVLE/jlPVKwf5XLrCD
ttZIOVxUqFqNozRWLjD31py/4rUnIydEbS1/VJgAUqKXphveSQGDXd7EotZI72sZNfO0wOhJEVEA
/UhNPDSGLpqNa9dEmh17xVeUIbDhC5YUqhT2U1tr84ASXfe7MFy5vQ3P9HB4zV8aGVIRsvFyGpXG
rd6InMHwnxu+e4G4GFwB9aK75kjBrA19tgeGl3eWikQthsPbO16pB8si5q7WatXh7ogCZb3Ke0fd
XpxrYwojDKcj28YUb2VTlqRVqHM7lqdeTEZeUxpkSnrePV9lqO10IfD3Xb/PJQupl8po/KyCWYjR
Ys635DGKE1hkdiwT86xw51RDcR8LXlBVLQ++xbzCn4WcKwepMPFjRwr4U6t47n/lF18yfTTxdo2s
7Ps9eNKhs1MwOSLgArCgwAYMLy4XMjl0RVq5kEW6q4AjQE2CQL/HBSJSg0Um0hwfdmf5mx78zNPa
E+l4qED3+o4WITgBRWK1y8sAJ7zF466DPrztoPtOEuRy49C2O/NmIt3EAlHyyMDZ0r9Y8OxrANyj
l/Uv+n25A8xeLA98MrwcXg276Te3ndXTriwixv7C65iYcJgUIz8bKYHVNADo4TBfFGHoA5faBXRC
1HlKDEXZGXDk3N1dhxw7kSSWXyv8iXGpRIcOpIN4i4HX+cpOQQOtMmGSSAXIxq9MKXZ6HHsnG2RE
kczXbCk+KzJhy9IBG99WB1PnVHWuR4YVpKvvRkzSETBaGd+xSJypucTqIjnBqAk5L2IhPc2CYV9I
yHCi82o8pIOAcDsUuFukwz+Jg0Oyn0z5k2ge2JmDMPa7cIU6D4rQc0GO83iFCNCztv7MIzuY3nyD
piyf2jF1PqO9zH697h2eKxRzeswVZ4Pka9eOrw5/F/6VcE2NREdSUBHVTR+KiQ8DKfRkiCh+o3to
hzby394/DqLKyo+SvOaSRH+i06rtN0BPx2MMihvwUQINBAU9vApoldUUsG8WCmNqQKHC6G1N0NHI
4AWjq28wPO73ZUMXXpaPc+1JVmwG8k/82A3wHs7RR4whp+nj1qWZVXLmPVJ+OYtjL58B1zETLieO
kGB2FhJ580wKaVdh0PwQtRD8HnGElTztGVAWz9Vc8VvhCZVHZ1sew6DzUuERsjjfRXAwdU0vnB7d
cwMdqfhdxUDIx0KK6kOAOHemGs4/1lixbIdv8/bmqXJv+1f8xlrOvMvFBZzRmTTCZTWZD+xQGGee
4DFQzUVYkVGJ7AAmaFIbqk7Mo6dE7bRBOGH/gk8ma+g5/ej6KncRXHb2jh8CeyjkE6gaoS4bEiCt
3ely90S3Kf5fca+txfVSPq54+9KUoPWBnajQY2+mnOflbrlCd7XTvV7FimePlgTFpvOJ/MUdcJOZ
La7BxpVgVrEqVJhPmm/pzi4ATsF5pEp4Tga+BjjmyOjPXTF1ZjHR/KIrc+g0Zkb1dsw0RgkKygi5
p29ohHWHJ7PQax9rer3bLF/aZlFlu+mC3amHmi4Jw8H1BfuwlgqhMoHicY7RhPLEKC1ysp+74qgp
Rm0OvRIyaPU2gUySI8F/ow4ca8Gmrf5Rc6b3rSZRElJL7K9RmVzJxlx7+/YFAfCEhoHUqMxNa1kX
sFOXfUE/Z0H4JV5CsNea4XVshB0Ps/ZQHDS0dwTBAjNDMH2gHScSxMIjon/jaynbdQnqSnpdQkrN
7j+ZmuBn/gb0HGyB8g2I1PosEvayLjJMsyJIzlUCf3kLjPbu+hPfgWUtqPmzKlUpv1UnoV+Y5Eqc
cc90XkYer3OYx4cmq4Qfh4LbEqYk6zA3zhz4l/BFoTODx1HOeB8PHG7e+wNOR6kTy1xTJ8yVVo1m
jEOPV7YgMoTLfenkfNhtX17gV+b2nO4caY7w4wXkLl0A0ktdv0j3Q/w55mUYBOCckew9kJ4s1AD1
PY4MQYUr6jxEgJngIvnrY3QfJsXkvqsdrofRa9HSvX3AQLGkdCApO77VzfBPEheQnAXezWAhbHv4
9sdIhb6w+GAlsISpbku3SaK5WZgk7QmLz35QirjDlrJpVaUMNUt6q5ft6idbXZYU/evh0GQ0kkRs
o5GlVFiRFNyvJmsvn54oYjscIvTi/Z+WwM1fZxBbSun3AiEVIwHUg+ALNRezSk2R3eUuSSjfrhtb
Wv7qWesWuI2IQFJ6bMQYow+dY1ygp+2PDpNLHY+zY03S9oR7fSemXNPdIHfeTYdTGk+ybhBqey8u
h8XcFXj6cJK4jkguk6Y3yEYNoEdlLoljt6FJktVbgEkcrn1Vb6Ka7BRR2qz17dtmte/pzctmtX3r
jZarn+8vy4aJlubuOuFbVau60W67fFptX3v79/UK/Tt7Khwpy2ukkQbW3F58vBw23z/eKK91l93x
2JVnHBIxWTCc24G3cCTz7iNqGjiCAwRiXHV3cT0Qt3KCBBEvaiIxdPqXqPjvqmDq31wN+kUi7YTT
DA1Ste8IJsdQxcwLk0AwOsZWZDeXd7cs2fuKp5DkrQFlH/wE40RL8g9CgJdf4LQTATq8vuA3MjVa
XF9cdI+mzkIhhA5RH7UjpYkAcoa+BJeX14si07ADyCOdhYKnNk2V1P8aR6pzGOfh8LIvj7TJpiMZ
35BGl8tga/zvdsv3Z1ygzKHkpm3ZcLxbvq573z6+f0cOqW06K3jnoxdbQCI9rAmuMSexfKIoOA9/
csc5Y+A+9V2u+fiY2eUkOCrRG0XqVRVJR3WjLTw9cjTMvkL3C4KODWktBVqNFk8dvwDhDFieAqRX
X9Ukb6S3UuXSTYcJPms9Oyb6mTquRWnAogi62cFwHvPiZGp1tJhev+D+vf3Y0+e3AudjFVV05AQz
6OiseQ1TMmeYDyUWrOrowzM45acglWJm307UKKD5pbNimvMTkG5QAuTPO65wJNYFaXPq1ZEa85MA
TXu7ZQcqf3O7gD1JssRDyAJHuwvgnQPEi3zQv5gmnSBfJ/3+zeIs5vJm0IkZQ/fD2zoxqH/AY6iz
0ee+SgfDfncV6VDd3Fzf3XaCgEZenhRInh3KklmkABLSUlaCNpzuCVEEF+RgmkiuXDYLGX1QnHn/
26MugC1eTTxgX97Xb0/7HnAyZCT77ePQO1kR916XvyqZY/myJ1d1dFtfP/0fSQb1mqbrl3dyMnvF
UNybt+9bex2XuMZ+Yx4eU9bZw1QSS7sBeTirStDJS8lrtsJhVhmJ46rjfO0OBG1YHQa/C8HG6ijt
uqmgXW/CrvnAB3UYZvLDNMpngSpQuRAXoQ6jVEpnUc4jZR9DG1whqEYd7UXQN6ObQcc9dq4YR2VY
N/7r8gf5LraZAtoEXGfYMTBkh9ExYfxE5uSoPC1uV1C30aEzF7jckijfzOM+eHvTvt7Ar24Yudqd
Suo7tph9jgrlvdC/kVsF1AFvx0c7lJtnQrYU07QHLdihkC2CN4kzMeQLITr22EBQsNMJWE5H5/HW
uZHHw3kkdYE8JK585UjHUub6hSfZXFMHJZg0CIY2EC5Z6UvkD8HUJg4wR6NU5LypofEcU912IJru
jY3DXpPJucZ4FIss71gBvkb+Wgg2hIBHKC3PCO8r9duiw0CF8iCoRy/tbrMzVbFupC86Tvzk+dd+
s1q+mPAF0swXrc3ixDBJjufzukGkTpQ76bCUgWHH9EfC7J8LsmYoyHde2LrZrhoL7DOZe5wSPFLe
Kgz4boWgOz4tWu7OxoEX1hPTUVSO7j8GvFP8CXDdAXCV0x9c6YvhdceLiUn49rJ5+/mp/5kGMp2M
euVC/3h7AoRGhQwMLMpDlf/6JxScsqkfTcjj6Vhpttv8+GHdLVJTcFQmXtrssfKxuYNo9VxFxUQZ
0ulqAaeeSrORJ5z/FvQotp6HOqyngQWppCKSy6gvNu9VdgHTIafePIVdXVHY1d4n7DeThOBzaxYc
ewjzLflSfF27vSqUrjFMFmZ/5AcN8+FK35A5hbEMPqkg4BFNYV71GaquADEqX3RuxIL2hDL7loZ+
ran7sNmBXMotGyzmx2SK2VYTbla77X77/dCb/npf77489H58rEGya7sjZmri23bpwJ3CecIraLJA
Cr2UDm/7g7zVEFhMy58f7zj4++3LGrWd69WzpTM1LTDqnVZ59fa0226euAKywo2CURUTN7wdCDeq
wNIbumAw4k4Edd8E9rZkotBTjd9GY9bHn4L7VJfIRcvty6FwN+i+PsubycBDRYH5Z8Z93jZH0e+b
N7qJaXgnOfRQbz92lnb49DadOiZGgf2oivliP8UZZrsKldeohU6GF7xJllEcJ0IQeD0tK3DCM4Aw
y/mD/IjIQt6ixzs2MhMUksoPRrFgMBSHYS7qGtP16/awRrdlbl3qjJJsw/tT9Khtl35/3f9ojpgG
4Cf9a39Yv/bitx4G2Ph8uhrgLnzyaOHL/u5QXyF8d0ITEORQwZ9/gX58Eo8Qp4L1vbC3JfOQWQ5+
el86EJ0elAGwEitVqo+5KpuqruM0LLWAwIebdDKl7+CpWoZyUvAyKgpk1/THtz2NQ723qxBhEj+H
t5fJQhWDYRTi7SvPY1ko4D2EUAhOWMxQk44I+Y0o1YiXEraEbL5tvaOMsm+wJbxu3zYHYIQY7XHK
SMXMJqwiN40FJXP0IFlXaCH2M/nEFVmbY6RYBla8dhifVpsJ1SpaRUBgFs8xyh00lDMlHmP+XTML
7KADi2xQCN7JQLvsoF1JtNTzQb4ea4n+j0xayKTJWIstHWUdr4v8oKPoeCCXBEoSa38BbBd3OT72
A69AowDDbhwLRXHmjy2DRtc84vYNQ6HYgtZaVu0iR6KcMYIojhDADQ0Px1octjHGCBJoZRydBtlM
pGUzw89Yt4JPGjLFV/gLw8ngdGRmo6/ju5ubC6kVuTvmWuDG+q+xyv4C3lqo16SGF2p9gLLi3Mla
s8NsPfv1x9OWslqfXlftY8egE6etDR/NBK95IuKFZha0yiSo+QvjyJcUGSZBw9QP3JQ1vsbQIOO6
SSfGIjj9SdE362+lB52z3iAWGC7B8l3JQbAPRtRitqXmR6s7j+ykdmhBGZdnq03KlZeoGsu0aSeJ
fOuk/cSTi45kUrvUccczO9Cp46snpar+ovWc8riboJz1vjjRgYbJnPltxcB0DmdB+si8tTV8Rwo7
9G2Y9pw85WVQg0G/NlQnYqbzk2Fxo6KvkuxlyMFXzgjd0FJkhds1pvnI51m9slmUpTiKI24l1iEY
wx0/sP0KQ8dwwWffM1YPcZ42PuMkssUTYSI5wATzUXHvc6Wn1oIun5jTiDZey9rSIrt+6rHRvo8w
F69yEjRgnwR8RSWCDO55lohD4n2zlE/sWIBmZTdEnDFHRPCVl99qAG5WnRrxlf3sK7rEw7s8ceSP
WC8cea7L5kA8jUeqJhRfgYbMRJ++rB1KHZxQ6GMC+zNEcv99qMwS+EM97NggE5l2Hy2uOqk3MjXt
emmCd11C3z7qB5EtkLbdyhJTOFeiDp5xrHlJgIJ1S6vWl2pzErFM7Cr5bJO+K6hHawh0pb78+382
++1weH33pV8LYI0AzARBvMTVJW8RZoFufwt0y9+rWqChcFvZAAlpFmzQb73uNxo+FGJ6NEC86VoD
9DsNF+7SGiAhUYUN+p0uuBESTtgg/urcAt1d/kZNd78zwHdSHg0LdPUbbRreyv0EwgPOfSGAslVN
X7pFb6LkSaC04/PnX70tcvkKIfdMhZCnT4U43yfyxKkQ8lhXCHlpVQh5AI/9cf5j+ue/pi9/ziz2
h4UQIawiC1lNAwx75OAJJcUDKxGOF4ipB4+QKPPyVMgCVIHSGM7ocy97TP0gOPO6ifLOQlJPMOGo
EL6Dt/KCAqzCRLmUBbXefec+KsvTma+l2GW6yLOxtYpJ5p6td2/rl97zcvXT5EqpBFJyufTT+3Gg
Jrpmc0ml3nebt8NPcsx4el3vf7StIo1jVlHKExUbBaIL7gHAo1Pgv+MRe1WTBCnjgCntetIdWWVR
2fJ5MgqK7ev75mX95bB5XfdWz+vVzz21dWWe72rNPdVIGSL8aMzxsV6E3trFXKVRzbfTDmxFiDDX
ZU50TrUFAoip5O/+xeDk1YnJnmHrC4Efs3mp1FMuVasEx9g8wjAFWG4UC8l6aNNtZVq1Prou+Uw9
zMqhzTfUnWkRiIGuUfQMfU0ZkOoukDbFdFUcBbbGzrwuTtF3xFMzlF+Ei+RQTXxS4NTDVdceHi+X
Tcf/ffFf326rCd96tOM1AcDd9bePHz8aSYGoh8hTFuVqfrpRlQjEPCT8nmAw8QhTTAp+0EE+oiyr
HPtJl3hl0yk2hpq1u66idDQA6ndmRa4ljZFBPfDzyRDN/Q3FuOxuKL0LtZiYL6vdWovc1eRpI2i0
UUDiWPWC7ernx7tZvtPl2w/bIiR2ZjkG9MlaOU9qr0BiMc0jDLSp+a5LYHd1ClSqNFJxcPTiQQW5
d9IuGSLudHGe1ZMdUc7CzkijSG9uOTa5NV0apc1wgzza3nUavYwNnHmemPmyugVVTGIWHIXT4ul9
2pcXyvs/eq8fh/V/a/hlfVj9+eefn9t7aprBtph5CyldjpkD0K6mK2BzWp6tZD43IFhp8RyTJHVg
8WWFvJqTFCZudQ8hKJqgAuyujpeoLMZTSgfQ72fagqYKCv1AvWAsp+Whl8JUR8s42SqNJgWd4B0v
nZmtqqtZkhtCuR365xBCtGVDpKsY3xP8IQzGST3Xwxh7QXtOpk4u7Oc0dKkQwcOED0JykcSy5frZ
PsYKfg8kjgNSvXvdsUOYXqBEG3hCUWovnr8rO7Pw0pSCh/5jDmQWbA7ObgxGSIucxyzmYpDRETDO
I3Pm0wfWbtNt6iRVyZTHVEzcmKjNCgwHGjpxHmHmZidO3QYEr3dgBZvKaTB1A+GUBU0ttRsaKIEL
7sTWnjqnNV5mtn28ETeZtZMKBjNXuK8mO1Zy09GS+9eoWqm08Dtm0gize8h0mslwMBXdMKMwlulm
w7q5Om5D8ndNvQWmYZMBJj18mdtNyPaAuBkAM8HAhgAkDfBp/oieYrpBiqfU0Vo+rw7lusMkNNoO
c4w53BQXU6ExtrOOgafMdk6cSIEyASLlIS0NoI31QccbZAEJeLju4cOTC9Yehm/i90mF2ZZETpWs
amYT17KKxL856Yky1BiZrmY1VmaOA4EvaD21kgVWSGQl00Ymhdq+bhiIjlPRXArQkDK3z3q9+tht
Dr844VDupfLGDiaMp8mQCCa9cKhyt3stIquarmSd09uUU5fNbCr2XdVz6WOSHROaOrtf74ctSMG7
dW+76z2vX94p04YFBp5oopJacGXr8aD9HATGU9C/2sM2dBTMHAzbmLbwR0q7EC7cFh4ftqFpNGkh
4RkLPKoemgUSvF5jPrPWwNPELKtj872XRBP0u/3J5XOuPtw4zlZYuL4m3QAxi0wtk3F/MAxzztqg
RGBKpVa78GH78/HG5z73co95Ef0QLnbKJp+HqDybehHPi5eQ5sI2Nmcfh+c1HM2rJYbY995WOMfR
/uvfzeH5/xu7lubEYRj8V/gJvHame3QeFHcDpE5ogEuGbpluDsBOoIf992s5duI4kumpM/7UWPgh
y7IeI3a7XX9XCoqO96O9pQ3zRGSjGUQ/HC6lSGHTcbpJ9pPZmCgG3NBm8SvH6h1rOJYfkjduSHjZ
JH5Qvrnn60ffDch0HHiHKiRefFuYeiHXrOCvwRpOBH6ZbzeQn7edv3MpaguB+NotoXwlORxOAmFH
WkjUzvJkGHnA6Jvz0cYqUX1KDRBjQYSzqX9SgOIBQT4ZR1RFY70iXU1mMP7fWIurCH8PaGH/f3O5
VuOkpLJsGLG4iiZEpI5FQbwbdhTTH/grSkcxm3q/kS3ZhF4cEpU9IMtDAlQVMiOQnsXkp5eiSJ1P
NAun+vun72lvTk1MjrP1NuCYVmBwEc4R9uWlsVhQzwFmwbFVnCQc93psabLcuxqAwDtDEWGz0fBC
/fWKhCU7MO/pkbEkY/5VYES1X0QTkZwtLlIq2Kg9pLyjmRcbd1LaF4v6dLvJkwuRLUjGcpeEdOEx
Qptwl9Lw09y7jin3nw5eIgEMx8vH9Txaf53fT3VT+Fy5ZiM/EKK4yjAVayzLkhkEEcC1Zr0dqCwK
UUJ+uHsa7IHIVETOmTmkGPT7ArU6RQxRA+ke2YLqAgi3yEf9t4SZ1jK/RSwIw6RLB8q453AssFGL
3yC1Vh6HA96b2TvVd4g4kZpVU7T3Vn1ejqqikXpucywkAV8zsUfu8Y1xuXqvj/W/UX39ulcXO4Nt
wHMoTi+yntrZ3T87HPl9JhYD0uNDKWPLNtSGaYQcQnhYOoTsIqjyXJZ6opzs/hyHRK1oIB+e4xbI
823Zu3hIvaA/CbLBb4HRJAkP42BPnbEWyRxnBQiYKKRsGfYfEG/SEsWdFqQE8ipBIc4n20Y8b+az
KdJs5gC3g6n0nMTwGEYOG+0m2a9+K8UU2r47QLM9Ak1LuXvCZ1jDKrYmxfnUJJwRPkgaZ0TMfwfn
y+0Kl+yaBgzaXh6C8MUHE4PYDVQZHLh9I7aQ5KBKTA4B5e+J0W+I9rltuc1KlXnVbQJTbdnbrdAe
9Vh4tWtmJdoh29nbxsjZIW2MWGv/VJO3UI7b4PHZD3wVEbE68TrScmMsop6ROQN7VUJssJaZDApT
Mo5FICgZ+Outl2gYAn1VMT/mWvX/AxcIDFRg1AAA
--===============8825514644535942271==--

