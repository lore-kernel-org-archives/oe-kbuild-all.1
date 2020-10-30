Content-Type: multipart/mixed; boundary="===============6824486408983314134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [jolsa-perf:rostedt_ftrace/core 2/3] include/linux/ftrace.h:107:9: error: implicit declaration of function 'arch_ftrace_get_regs'; did you mean
Date: Fri, 30 Oct 2020 09:58:26 +0800
Message-ID: <202010300921.FDhN0lY6-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6824486408983314134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git rost=
edt_ftrace/core
head:   4c704bce795d69a9db9d2d21d11612bc78b3e54a
commit: ab1b08b2eb044cc90aba1f2732442214433cd1ed [2/3] ftrace/x86: Allow fo=
r arguments to be passed in to ftrace_regs by default
config: x86_64-randconfig-a006-20201029 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/co=
mmit/?id=3Dab1b08b2eb044cc90aba1f2732442214433cd1ed
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kern=
el/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf rostedt_ftrace/core
        git checkout ab1b08b2eb044cc90aba1f2732442214433cd1ed
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:49,
                    from include/linux/trace_events.h:10,
                    from kernel/trace/synth_event_gen_test.c:9:
>> include/linux/ftrace.h:102:63: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                               ^~=
~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:107:9: error: implicit declaration of function 'a=
rch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=3Dimplicit-f=
unction-declaration]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         ftrace_get_regs
>> include/linux/ftrace.h:107:9: warning: returning 'int' from a function w=
ith return type 'struct pt_regs *' makes pointer from integer without a cas=
t [-Wint-conversion]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: At top level:
   include/linux/ftrace.h:111:40: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     111 |          struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                        ^~~~~~~~~~~
   include/linux/ftrace.h:279:34: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     279 |    struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                  ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/trace/ftrace.c:29:
>> include/linux/ftrace.h:102:63: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                               ^~=
~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:107:9: error: implicit declaration of function 'a=
rch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=3Dimplicit-f=
unction-declaration]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         ftrace_get_regs
>> include/linux/ftrace.h:107:9: warning: returning 'int' from a function w=
ith return type 'struct pt_regs *' makes pointer from integer without a cas=
t [-Wint-conversion]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: At top level:
   include/linux/ftrace.h:111:40: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     111 |          struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                        ^~~~~~~~~~~
   include/linux/ftrace.h:279:34: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     279 |    struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                  ^~~~~~~~~~~
>> kernel/trace/ftrace.c:82:11: error: initialization of 'void (*)(long uns=
igned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)'=
 from incompatible pointer type 'void (*)(long unsigned int,  long unsigned=
 int,  struct ftrace_ops *, struct ftrace_regs *)' [-Werror=3Dincompatible-=
pointer-types]
      82 |  .func  =3D ftrace_stub,
         |           ^~~~~~~~~~~
   kernel/trace/ftrace.c:82:11: note: (near initialization for 'ftrace_list=
_end.func')
>> kernel/trace/ftrace.c:119:53: error: initialization of 'ftrace_func_t' {=
aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, =
struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsig=
ned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [=
-Werror=3Dincompatible-pointer-types]
     119 | ftrace_func_t ftrace_trace_function __read_mostly =3D ftrace_stu=
b;
         |                                                     ^~~~~~~~~~~
>> kernel/trace/ftrace.c:143:38: warning: 'struct ftrace_regs' declared ins=
ide parameter list will not be visible outside of this definition or declar=
ation
     143 |        struct ftrace_ops *op, struct ftrace_regs *fregs)
         |                                      ^~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'ftrace_pid_func':
>> kernel/trace/ftrace.c:157:36: error: passing argument 4 of 'op->saved_fu=
nc' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
     157 |  op->saved_func(ip, parent_ip, op, fregs);
         |                                    ^~~~~
         |                                    |
         |                                    struct ftrace_regs *
   kernel/trace/ftrace.c:157:36: note: expected 'struct ftrace_regs *' but =
argument is of type 'struct ftrace_regs *'
   kernel/trace/ftrace.c: In function 'ftrace_ops_get_list_func':
   kernel/trace/ftrace.c:128:31: warning: cast between incompatible functio=
n types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)=
(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace=
_regs *)' [-Wcast-function-type]
     128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
         |                               ^
   kernel/trace/ftrace.c:174:10: note: in expansion of macro 'ftrace_ops_li=
st_func'
     174 |   return ftrace_ops_list_func;
         |          ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'update_ftrace_function':
>> kernel/trace/ftrace.c:193:8: error: assignment to 'ftrace_func_t' {aka '=
void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, struc=
t ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsigned i=
nt,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Werr=
or=3Dincompatible-pointer-types]
     193 |   func =3D ftrace_stub;
         |        ^
   kernel/trace/ftrace.c:128:31: warning: cast between incompatible functio=
n types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)=
(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace=
_regs *)' [-Wcast-function-type]
     128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
         |                               ^
   kernel/trace/ftrace.c:207:10: note: in expansion of macro 'ftrace_ops_li=
st_func'
     207 |   func =3D ftrace_ops_list_func;
         |          ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:128:31: warning: cast between incompatible functio=
n types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)=
(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace=
_regs *)' [-Wcast-function-type]
     128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
         |                               ^
   kernel/trace/ftrace.c:220:14: note: in expansion of macro 'ftrace_ops_li=
st_func'
     220 |  if (func =3D=3D ftrace_ops_list_func) {
         |              ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:128:31: warning: cast between incompatible functio=
n types from 'void (*)(long unsigned int,  long unsigned int)' to 'void (*)=
(long unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace=
_regs *)' [-Wcast-function-type]
     128 | #define ftrace_ops_list_func ((ftrace_func_t)ftrace_ops_no_ops)
         |                               ^
   kernel/trace/ftrace.c:240:26: note: in expansion of macro 'ftrace_ops_li=
st_func'
     240 |  ftrace_trace_function =3D ftrace_ops_list_func;
         |                          ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function '__register_ftrace_function':
   kernel/trace/ftrace.c:335:13: error: assignment to 'ftrace_func_t' {aka =
'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, stru=
ct ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsigned =
int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-Wer=
ror=3Dincompatible-pointer-types]
     335 |   ops->func =3D ftrace_pid_func;
         |             ^
   kernel/trace/ftrace.c: In function 'ftrace_update_pid_func':
>> kernel/trace/ftrace.c:370:28: warning: comparison of distinct pointer ty=
pes lacks a cast
     370 |  if (ftrace_trace_function =3D=3D ftrace_stub)
         |                            ^~
>> kernel/trace/ftrace.c:376:21: warning: pointer type mismatch in conditio=
nal expression
     376 |     ftrace_pid_func : op->saved_func;
         |                     ^
   kernel/trace/ftrace.c: At top level:
   kernel/trace/ftrace.c:584:5: warning: no previous prototype for 'ftrace_=
profile_pages_init' [-Wmissing-prototypes]
     584 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:757:40: warning: 'struct ftrace_regs' declared ins=
ide parameter list will not be visible outside of this definition or declar=
ation
     757 |         struct ftrace_ops *ops, struct ftrace_regs *fregs)
         |                                        ^~~~~~~~~~~
   kernel/trace/ftrace.c:6867:12: error: initialization of 'void (*)(long u=
nsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *=
)' from incompatible pointer type 'void (*)(long unsigned int,  long unsign=
ed int,  struct ftrace_ops *, struct ftrace_regs *)' [-Werror=3Dincompatibl=
e-pointer-types]
    6867 |  .func   =3D ftrace_stub,
         |            ^~~~~~~~~~~
   kernel/trace/ftrace.c:6867:12: note: (near initialization for 'global_op=
s.func')
   In file included from arch/x86/include/asm/bug.h:93,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/stop_machine.h:5,
                    from kernel/trace/ftrace.c:17:
   kernel/trace/ftrace.c: In function 'ftrace_init_array_ops':
   kernel/trace/ftrace.c:6903:29: warning: comparison of distinct pointer t=
ypes lacks a cast
    6903 |   if (WARN_ON(tr->ops->func !=3D ftrace_stub))
         |                             ^~
   include/asm-generic/bug.h:119:25: note: in definition of macro 'WARN_ON'
     119 |  int __ret_warn_on =3D !!(condition);    \
         |                         ^~~~~~~~~
   kernel/trace/ftrace.c: In function 'ftrace_reset_array_ops':
   kernel/trace/ftrace.c:6913:16: error: assignment to 'ftrace_func_t' {aka=
 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, str=
uct ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsigned=
 int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-We=
rror=3Dincompatible-pointer-types]
    6913 |  tr->ops->func =3D ftrace_stub;
         |                ^
   kernel/trace/ftrace.c: At top level:
   kernel/trace/ftrace.c:6918:45: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
    6918 |          struct ftrace_ops *ignored, struct ftrace_regs *fregs)
         |                                             ^~~~~~~~~~~
   kernel/trace/ftrace.c: In function '__ftrace_ops_list_func':
>> kernel/trace/ftrace.c:6920:41: error: passing argument 1 of 'ftrace_get_=
regs' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
    6920 |  struct pt_regs *regs =3D ftrace_get_regs(fregs);
         |                                         ^~~~~
         |                                         |
         |                                         struct ftrace_regs *
   In file included from kernel/trace/ftrace.c:29:
   include/linux/ftrace.h:102:76: note: expected 'struct ftrace_regs *' but=
 argument is of type 'struct ftrace_regs *'
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                        ~~~~~~~~~=
~~~~~~~~~~~^~~~~
>> kernel/trace/ftrace.c:6953:32: error: passing argument 4 of 'op->func' f=
rom incompatible pointer type [-Werror=3Dincompatible-pointer-types]
    6953 |    op->func(ip, parent_ip, op, fregs);
         |                                ^~~~~
         |                                |
         |                                struct ftrace_regs *
   kernel/trace/ftrace.c:6953:32: note: expected 'struct ftrace_regs *' but=
 argument is of type 'struct ftrace_regs *'
   kernel/trace/ftrace.c: At top level:
   kernel/trace/ftrace.c:6995:38: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
    6995 |        struct ftrace_ops *op, struct ftrace_regs *fregs)
         |                                      ^~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'ftrace_ops_assist_func':
   kernel/trace/ftrace.c:7008:30: error: passing argument 4 of 'op->func' f=
rom incompatible pointer type [-Werror=3Dincompatible-pointer-types]
    7008 |  op->func(ip, parent_ip, op, fregs);
         |                              ^~~~~
         |                              |
         |                              struct ftrace_regs *
   kernel/trace/ftrace.c:7008:30: note: expected 'struct ftrace_regs *' but=
 argument is of type 'struct ftrace_regs *'
   kernel/trace/ftrace.c: In function 'ftrace_ops_get_func':
>> kernel/trace/ftrace.c:7034:10: error: returning 'void (*)(long unsigned =
int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' from =
a function with incompatible return type 'ftrace_func_t' {aka 'void (*)(lon=
g unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_reg=
s *)'} [-Werror=3Dincompatible-pointer-types]
    7034 |   return ftrace_ops_assist_func;
         |          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'ftrace_kill':
   kernel/trace/ftrace.c:7470:24: error: assignment to 'ftrace_func_t' {aka=
 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, str=
uct ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsigned=
 int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-We=
rror=3Dincompatible-pointer-types]
    7470 |  ftrace_trace_function =3D ftrace_stub;
         |                        ^
   kernel/trace/ftrace.c: In function 'ftrace_enable_sysctl':
   kernel/trace/ftrace.c:7571:25: error: assignment to 'ftrace_func_t' {aka=
 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops *, str=
uct ftrace_regs *)'} from incompatible pointer type 'void (*)(long unsigned=
 int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *)' [-We=
rror=3Dincompatible-pointer-types]
    7571 |   ftrace_trace_function =3D ftrace_stub;
         |                         ^
   cc1: some warnings being treated as errors
--
   In file included from kernel/trace/trace_output.c:10:
>> include/linux/ftrace.h:102:63: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                               ^~=
~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:107:9: error: implicit declaration of function 'a=
rch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=3Dimplicit-f=
unction-declaration]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         ftrace_get_regs
>> include/linux/ftrace.h:107:9: warning: returning 'int' from a function w=
ith return type 'struct pt_regs *' makes pointer from integer without a cas=
t [-Wint-conversion]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: At top level:
   include/linux/ftrace.h:111:40: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     111 |          struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                        ^~~~~~~~~~~
   include/linux/ftrace.h:279:34: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     279 |    struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                  ^~~~~~~~~~~
   kernel/trace/trace_output.c: In function 'trace_output_raw':
   kernel/trace/trace_output.c:321:2: warning: function 'trace_output_raw' =
might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=
=3Dformat]
     321 |  trace_seq_vprintf(s, fmt, ap);
         |  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/trace/trace_functions.c:16:
>> include/linux/ftrace.h:102:63: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                               ^~=
~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:107:9: error: implicit declaration of function 'a=
rch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=3Dimplicit-f=
unction-declaration]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         ftrace_get_regs
>> include/linux/ftrace.h:107:9: warning: returning 'int' from a function w=
ith return type 'struct pt_regs *' makes pointer from integer without a cas=
t [-Wint-conversion]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: At top level:
   include/linux/ftrace.h:111:40: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     111 |          struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                        ^~~~~~~~~~~
   include/linux/ftrace.h:279:34: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     279 |    struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                  ^~~~~~~~~~~
>> kernel/trace/trace_functions.c:26:37: warning: 'struct ftrace_regs' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
      26 |       struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                     ^~~~~~~~~~~
   kernel/trace/trace_functions.c:29:36: warning: 'struct ftrace_regs' decl=
ared inside parameter list will not be visible outside of this definition o=
r declaration
      29 |      struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                    ^~~~~~~~~~~
   kernel/trace/trace_functions.c: In function 'ftrace_allocate_ftrace_ops':
>> kernel/trace/trace_functions.c:50:12: error: assignment to 'ftrace_func_=
t' {aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops=
 *, struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long u=
nsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *=
)' [-Werror=3Dincompatible-pointer-types]
      50 |  ops->func =3D function_trace_call;
         |            ^
   kernel/trace/trace_functions.c: In function 'function_trace_init':
   kernel/trace/trace_functions.c:103:8: error: assignment to 'ftrace_func_=
t' {aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops=
 *, struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long u=
nsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *=
)' [-Werror=3Dincompatible-pointer-types]
     103 |   func =3D function_stack_trace_call;
         |        ^
   kernel/trace/trace_functions.c:105:8: error: assignment to 'ftrace_func_=
t' {aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_ops=
 *, struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long u=
nsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs *=
)' [-Werror=3Dincompatible-pointer-types]
     105 |   func =3D function_trace_call;
         |        ^
   kernel/trace/trace_functions.c: At top level:
   kernel/trace/trace_functions.c:131:37: warning: 'struct ftrace_regs' dec=
lared inside parameter list will not be visible outside of this definition =
or declaration
     131 |       struct ftrace_ops *op, struct ftrace_regs *fregs)
         |                                     ^~~~~~~~~~~
>> kernel/trace/trace_functions.c:130:1: error: conflicting types for 'func=
tion_trace_call'
     130 | function_trace_call(unsigned long ip, unsigned long parent_ip,
         | ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions.c:25:1: note: previous declaration of 'func=
tion_trace_call' was here
      25 | function_trace_call(unsigned long ip, unsigned long parent_ip,
         | ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions.c:180:36: warning: 'struct ftrace_regs' dec=
lared inside parameter list will not be visible outside of this definition =
or declaration
     180 |      struct ftrace_ops *op, struct ftrace_regs *fregs)
         |                                    ^~~~~~~~~~~
>> kernel/trace/trace_functions.c:179:1: error: conflicting types for 'func=
tion_stack_trace_call'
     179 | function_stack_trace_call(unsigned long ip, unsigned long parent=
_ip,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions.c:28:1: note: previous declaration of 'func=
tion_stack_trace_call' was here
      28 | function_stack_trace_call(unsigned long ip, unsigned long parent=
_ip,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_functions.c: In function 'func_set_flag':
   kernel/trace/trace_functions.c:254:18: error: assignment to 'ftrace_func=
_t' {aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_op=
s *, struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long =
unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs =
*)' [-Werror=3Dincompatible-pointer-types]
     254 |    tr->ops->func =3D function_stack_trace_call;
         |                  ^
   kernel/trace/trace_functions.c:257:18: error: assignment to 'ftrace_func=
_t' {aka 'void (*)(long unsigned int,  long unsigned int,  struct ftrace_op=
s *, struct ftrace_regs *)'} from incompatible pointer type 'void (*)(long =
unsigned int,  long unsigned int,  struct ftrace_ops *, struct ftrace_regs =
*)' [-Werror=3Dincompatible-pointer-types]
     257 |    tr->ops->func =3D function_trace_call;
         |                  ^
   kernel/trace/trace_functions.c: At top level:
>> kernel/trace/trace_functions.c:25:1: warning: 'function_trace_call' used=
 but never defined
      25 | function_trace_call(unsigned long ip, unsigned long parent_ip,
         | ^~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_functions.c:28:1: warning: 'function_stack_trace_call=
' used but never defined
      28 | function_stack_trace_call(unsigned long ip, unsigned long parent=
_ip,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/trace/trace_preemptirq.c:11:
>> include/linux/ftrace.h:102:63: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     102 | static __always_inline struct pt_regs *ftrace_get_regs(struct ft=
race_regs *fregs)
         |                                                               ^~=
~~~~~~~~~
   include/linux/ftrace.h: In function 'ftrace_get_regs':
>> include/linux/ftrace.h:107:9: error: implicit declaration of function 'a=
rch_ftrace_get_regs'; did you mean 'ftrace_get_regs'? [-Werror=3Dimplicit-f=
unction-declaration]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         ftrace_get_regs
>> include/linux/ftrace.h:107:9: warning: returning 'int' from a function w=
ith return type 'struct pt_regs *' makes pointer from integer without a cas=
t [-Wint-conversion]
     107 |  return arch_ftrace_get_regs(fregs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h: At top level:
   include/linux/ftrace.h:111:40: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     111 |          struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                        ^~~~~~~~~~~
   include/linux/ftrace.h:279:34: warning: 'struct ftrace_regs' declared in=
side parameter list will not be visible outside of this definition or decla=
ration
     279 |    struct ftrace_ops *op, struct ftrace_regs *fregs);
         |                                  ^~~~~~~~~~~
   kernel/trace/trace_preemptirq.c:88:16: warning: no previous prototype fo=
r 'trace_hardirqs_on_caller' [-Wmissing-prototypes]
      88 | __visible void trace_hardirqs_on_caller(unsigned long caller_add=
r)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_preemptirq.c:103:16: warning: no previous prototype f=
or 'trace_hardirqs_off_caller' [-Wmissing-prototypes]
     103 | __visible void trace_hardirqs_off_caller(unsigned long caller_ad=
dr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..

vim +107 include/linux/ftrace.h

   101	=

 > 102	static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace=
_regs *fregs)
   103	{
   104		if (!fregs)
   105			return NULL;
   106	=

 > 107		return arch_ftrace_get_regs(fregs);
   108	}
   109	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6824486408983314134==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6824486408983314134==--

