Content-Type: multipart/mixed; boundary="===============1175086555750068631=="
MIME-Version: 1.0
From: Joel Fernandes <joelaf@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [jfern:rcu/refperf 1/3] kernel/rcu/tree.c:3979:8: error: passing argument 4 of 'proc_create' from incompatible pointer type
Date: Fri, 15 May 2020 10:48:08 -0400
Message-ID: <CAJWu+oqvP1AhGMuYFqLKBz7TXUYHSRabead4XFFVUPGc4v_pOw@mail.gmail.com>
In-Reply-To: <766e27b4-5eb0-733e-1005-87147766a2c6@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1175086555750068631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks. Is there a way to also add a file to the tree or a commit message
that says "DONOT TEST" or such?  Then no branch renaming is needed.

On Thu, May 14, 2020 at 8:41 PM Rong Chen <rong.a.chen@intel.com> wrote:

> Hi Joel,
>
> We have a configuration file to set the properties, the definition is at
> https://github.com/intel/lkp-tests/wiki/Repo-Spec,
> the branches named as ".experimental." ".*dont-build" won't be tested by
> default, or you can tell us the blacklist branch rule.
>
> Best Regards,
> Rong Chen
>
> On 5/14/20 11:42 PM, joel(a)joelfernandes.org wrote:
> > This is just a test WIP tree. Is there a way for me to mark some trees
> > as not for kbuild testing?
> >
> > Thanks for the testing though!
> >
> >
> > On May 14, 2020 11:08:12 AM EDT, kbuild test robot <lkp@intel.com>
> wrote:
> >
> >     tree:https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
> rcu/refperf
> >     head:   df3410c1f7436cf0a91127b2629a33923cc62140
> >     commit: e9577008869a8d050252b346823d54ab84af4021 [1/3] test
> >     config: i386-randconfig-r015-20200514 (attached as .config)
> >     compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >     reproduce:
> >              git checkout e9577008869a8d050252b346823d54ab84af4021
> >              # save the attached .config to linux build tree
> >              make ARCH=3Di386
> >
> >     If you fix the issue, kindly add following tag as appropriate
> >     Reported-by: kbuild test robot <lkp@intel.com>
> >
> >     All error/warnings (new ones prefixed by >>, old ones prefixed by
> <<):
> >
> >     kernel/rcu/tree.c: In function 'rcu_pr_kthread':
> >     kernel/rcu/tree.c:3852:35: warning: unused variable 'spincnt2'
> [-Wunused-variable]
> >     unsigned long spincnt, spincnt1, spincnt2, x=3D0;
> >     ^~~~~~~~
> >     kernel/rcu/tree.c:3852:25: warning: unused variable 'spincnt1'
> [-Wunused-variable]
> >     unsigned long spincnt, spincnt1, spincnt2, x=3D0;
> >     ^~~~~~~~
> >     kernel/rcu/tree.c:3851:7: warning: unused variable 'work'
> [-Wunused-variable]
> >     char work, *workp =3D this_cpu_ptr(&rcu_data.rcu_pr_has_work);
> >     ^~~~
> >     kernel/rcu/tree.c:3850:16: warning: unused variable 'statusp'
> [-Wunused-variable]
> >     unsigned int *statusp =3D
> this_cpu_ptr(&rcu_data.rcu_pr_kthread_status);
> >     ^~~~~~~
> >     kernel/rcu/tree.c: In function 'rcu_spawn_pr_kthreads':
> >
> >             kernel/rcu/tree.c:3979:8: error: passing argument 4 of
> >             'proc_create' from incompatible pointer type
> >             [-Werror=3Dincompatible-pointer-types]
> >
> >     &pr_ops);
> >     ^
> >     In file included from kernel/rcu/tree.c:23:0:
> >     include/linux/proc_fs.h:79:24: note: expected 'const struct proc_ops
> *' but argument is of type 'const struct file_operations *'
> >     struct proc_dir_entry *proc_create(const char *name, umode_t mode,
> struct proc_dir_entry *parent, const struct proc_ops *proc_ops);
> >     ^~~~~~~~~~~
> >     kernel/rcu/tree.c: In function 'pr_proc_write':
> >
> >             kernel/rcu/tree.c:3957:1: warning: control reaches end of
> >             non-void function [-Wreturn-type]
> >
> >     }
> >     ^
> >     cc1: some warnings being treated as errors
> >
> >     vim +/proc_create +3979 kernel/rcu/tree.c
> >
> >        3935
> >        3936   ssize_t pr_proc_write(struct file * f, const char __user *
> b, size_t s, loff_t * off)
> >        3937   {
> >        3938           u64 before, after;
> >        3939
> >        3940           WRITE_ONCE(work_type, PERCPU_RWSEM);
> >        3941   repeat:
> >        3942           smp_mb();
> >        3943
> >        3944           before =3D ktime_get_mono_fast_ns();
> >        3945           do_one_pr_test();
> >        3946           after =3D ktime_get_mono_fast_ns();
> >        3947
> >        3948           pr_err("Total time: %lu us , type: %s\n",
> (unsigned long)((after - before) / 1000),
> >        3949                                   (work_type =3D=3D PERCPU_=
RWSEM
> ? "percpu-rwsem" : "rwsem") );
> >        3950
> >        3951           if (work_type !=3D RWSEM) {
> >        3952                   work_type =3D RWSEM;
> >        3953                   msleep(100);
> >        3954                   goto repeat;
> >        3955           }
> >        3956
> >
> >         3957 }
> >
> >        3958
> >        3959   static const struct file_operations pr_ops =3D {
> >        3960           .write =3D pr_proc_write,
> >        3961           .llseek =3D default_llseek,
> >        3962   };
> >        3963
> >        3964   /*
> >        3965    * Spawn boost kthreads -- called as soon as the scheduler
> is running.
> >        3966    */
> >        3967   static void __init rcu_spawn_pr_kthreads(void)
> >        3968   {
> >        3969           int cpu;
> >        3970
> >        3971           for_each_possible_cpu(cpu)
> >        3972                   per_cpu(rcu_data.rcu_pr_has_work, cpu) =
=3D 0;
> >        3973
> >        3974           if
> (WARN_ONCE(smpboot_register_percpu_thread(&rcu_pr_thread_spec),
> >        3975                                   "%s: Could not start rcub
> kthread, OOM is now expected behavior\n", __func__))
> >        3976                   return;
> >        3977
> >        3978           proc_create("prw_test", 0777, NULL,
> >
> >         3979 &pr_ops);
> >
> >        3980
> >        3981           /*
> >        3982           for_each_online_cpu(cpu) {
> >        3983                   pr_err("waking up thread on online cpu
> %d\n", cpu);
> >        3984                   per_cpu(rcu_data.rcu_pr_has_work, cpu) =
=3D 1;
> >        3985                   smp_mb();
> >        3986
>  wake_up_process(per_cpu(rcu_data.pr_kthread, cpu));
> >        3987           }
> >        3988           */
> >        3989   }
> >        3990
> >
>  ------------------------------------------------------------------------
> >     0-DAY CI Kernel Test Service, Intel Corporation
> >     https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >
> >
> > --
> > Sent from my Android device with K-9 Mail. Please excuse my brevity.
>
>

--===============1175086555750068631==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhhbmtzLiBJcyB0aGVyZSBhIHdheSB0byBhbHNvIGFkZCBhIGZpbGUg
dG8gdGhlIHRyZWUgb3IgYSBjb21taXQgbWVzc2FnZSB0aGF0IHNheXMgJnF1b3Q7RE9OT1QgVEVT
VCZxdW90OyBvciBzdWNoP8KgIFRoZW4gbm8gYnJhbmNoIHJlbmFtaW5nIGlzIG5lZWRlZC48L2Rp
dj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFp
bF9hdHRyIj5PbiBUaHUsIE1heSAxNCwgMjAyMCBhdCA4OjQxIFBNIFJvbmcgQ2hlbiAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnJvbmcuYS5jaGVuQGludGVsLmNvbSI+cm9uZy5hLmNoZW5AaW50ZWwuY29t
PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIg
c3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdi
KDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5IaSBKb2VsLDxicj4KPGJyPgpXZSBoYXZl
IGEgY29uZmlndXJhdGlvbiBmaWxlIHRvIHNldCB0aGUgcHJvcGVydGllcywgdGhlIGRlZmluaXRp
b24gaXMgYXQgPGJyPgo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3Rz
L3dpa2kvUmVwby1TcGVjIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczov
L2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kvUmVwby1TcGVjPC9hPiw8YnI+CnRoZSBi
cmFuY2hlcyBuYW1lZCBhcyAmcXVvdDsuZXhwZXJpbWVudGFsLiZxdW90OyAmcXVvdDsuKmRvbnQt
YnVpbGQmcXVvdDsgd29uJiMzOTt0IGJlIHRlc3RlZCBieSA8YnI+CmRlZmF1bHQsIG9yIHlvdSBj
YW4gdGVsbCB1cyB0aGUgYmxhY2tsaXN0IGJyYW5jaCBydWxlLjxicj4KPGJyPgpCZXN0IFJlZ2Fy
ZHMsPGJyPgpSb25nIENoZW48YnI+Cjxicj4KT24gNS8xNC8yMCAxMTo0MiBQTSwgPGEgaHJlZj0i
bWFpbHRvOmpvZWxAam9lbGZlcm5hbmRlcy5vcmciIHRhcmdldD0iX2JsYW5rIj5qb2VsQGpvZWxm
ZXJuYW5kZXMub3JnPC9hPiB3cm90ZTo8YnI+CiZndDsgVGhpcyBpcyBqdXN0IGEgdGVzdCBXSVAg
dHJlZS4gSXMgdGhlcmUgYSB3YXkgZm9yIG1lIHRvIG1hcmsgc29tZSB0cmVlcyA8YnI+CiZndDsg
YXMgbm90IGZvciBrYnVpbGQgdGVzdGluZz88YnI+CiZndDs8YnI+CiZndDsgVGhhbmtzIGZvciB0
aGUgdGVzdGluZyB0aG91Z2ghPGJyPgomZ3Q7PGJyPgomZ3Q7PGJyPgomZ3Q7IE9uIE1heSAxNCwg
MjAyMCAxMTowODoxMiBBTSBFRFQsIGtidWlsZCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWls
dG86bGtwQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxrcEBpbnRlbC5jb208L2E+Jmd0OyB3
cm90ZTo8YnI+CiZndDs8YnI+CiZndDvCoCDCoCDCoHRyZWU6PGEgaHJlZj0iaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamZlcm4vbGludXguZ2l0IiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9qZmVybi9saW51eC5naXQ8L2E+wqAgcmN1L3JlZnBlcmY8YnI+
CiZndDvCoCDCoCDCoGhlYWQ6wqAgwqBkZjM0MTBjMWY3NDM2Y2YwYTkxMTI3YjI2MjlhMzM5MjNj
YzYyMTQwPGJyPgomZ3Q7wqAgwqAgwqBjb21taXQ6IGU5NTc3MDA4ODY5YThkMDUwMjUyYjM0Njgy
M2Q1NGFiODRhZjQwMjEgWzEvM10gdGVzdDxicj4KJmd0O8KgIMKgIMKgY29uZmlnOiBpMzg2LXJh
bmRjb25maWctcjAxNS0yMDIwMDUxNCAoYXR0YWNoZWQgYXMgLmNvbmZpZyk8YnI+CiZndDvCoCDC
oCDCoGNvbXBpbGVyOiBnY2MtNyAoVWJ1bnR1IDcuNS4wLTZ1YnVudHUyKSA3LjUuMDxicj4KJmd0
O8KgIMKgIMKgcmVwcm9kdWNlOjxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIGdpdCBjaGVj
a291dCBlOTU3NzAwODg2OWE4ZDA1MDI1MmIzNDY4MjNkNTRhYjg0YWY0MDIxPGJyPgomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1
aWxkIHRyZWU8YnI+CiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCBtYWtlIEFSQ0g9aTM4Njxicj4K
Jmd0Ozxicj4KJmd0O8KgIMKgIMKgSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9s
bG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZTxicj4KJmd0O8KgIMKgIMKgUmVwb3J0ZWQtYnk6IGti
dWlsZCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWlsdG86bGtwQGludGVsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPmxrcEBpbnRlbC5jb208L2E+Jmd0Ozxicj4KJmd0Ozxicj4KJmd0O8KgIMKgIMKg
QWxsIGVycm9yL3dhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSAmZ3Q7Jmd0Oywgb2xkIG9u
ZXMgcHJlZml4ZWQgYnkgJmx0OyZsdDspOjxicj4KJmd0Ozxicj4KJmd0O8KgIMKgIMKga2VybmVs
L3JjdS90cmVlLmM6IEluIGZ1bmN0aW9uICYjMzk7cmN1X3ByX2t0aHJlYWQmIzM5Ozo8YnI+CiZn
dDvCoCDCoCDCoGtlcm5lbC9yY3UvdHJlZS5jOjM4NTI6MzU6IHdhcm5pbmc6IHVudXNlZCB2YXJp
YWJsZSAmIzM5O3NwaW5jbnQyJiMzOTsgWy1XdW51c2VkLXZhcmlhYmxlXTxicj4KJmd0O8KgIMKg
IMKgdW5zaWduZWQgbG9uZyBzcGluY250LCBzcGluY250MSwgc3BpbmNudDIsIHg9MDs8YnI+CiZn
dDvCoCDCoCDCoF5+fn5+fn5+PGJyPgomZ3Q7wqAgwqAgwqBrZXJuZWwvcmN1L3RyZWUuYzozODUy
OjI1OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJiMzOTtzcGluY250MSYjMzk7IFstV3VudXNl
ZC12YXJpYWJsZV08YnI+CiZndDvCoCDCoCDCoHVuc2lnbmVkIGxvbmcgc3BpbmNudCwgc3BpbmNu
dDEsIHNwaW5jbnQyLCB4PTA7PGJyPgomZ3Q7wqAgwqAgwqBefn5+fn5+fjxicj4KJmd0O8KgIMKg
IMKga2VybmVsL3JjdS90cmVlLmM6Mzg1MTo3OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJiMz
OTt3b3JrJiMzOTsgWy1XdW51c2VkLXZhcmlhYmxlXTxicj4KJmd0O8KgIMKgIMKgY2hhciB3b3Jr
LCAqd29ya3AgPSB0aGlzX2NwdV9wdHIoJmFtcDtyY3VfZGF0YS5yY3VfcHJfaGFzX3dvcmspOzxi
cj4KJmd0O8KgIMKgIMKgXn5+fjxicj4KJmd0O8KgIMKgIMKga2VybmVsL3JjdS90cmVlLmM6Mzg1
MDoxNjogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICYjMzk7c3RhdHVzcCYjMzk7IFstV3VudXNl
ZC12YXJpYWJsZV08YnI+CiZndDvCoCDCoCDCoHVuc2lnbmVkIGludCAqc3RhdHVzcCA9IHRoaXNf
Y3B1X3B0cigmYW1wO3JjdV9kYXRhLnJjdV9wcl9rdGhyZWFkX3N0YXR1cyk7PGJyPgomZ3Q7wqAg
wqAgwqBefn5+fn5+PGJyPgomZ3Q7wqAgwqAgwqBrZXJuZWwvcmN1L3RyZWUuYzogSW4gZnVuY3Rp
b24gJiMzOTtyY3Vfc3Bhd25fcHJfa3RocmVhZHMmIzM5Ozo8YnI+CiZndDs8YnI+CiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoGtlcm5lbC9yY3UvdHJlZS5jOjM5Nzk6ODogZXJyb3I6IHBhc3Npbmcg
YXJndW1lbnQgNCBvZjxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgJiMzOTtwcm9jX2NyZWF0
ZSYjMzk7IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZTxicj4KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdIDxicj4KJmd0Ozxi
cj4KJmd0O8KgIMKgIMKgJmFtcDtwcl9vcHMpOzxicj4KJmd0O8KgIMKgIMKgXjxicj4KJmd0O8Kg
IMKgIMKgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGtlcm5lbC9yY3UvdHJlZS5jOjIzOjA6PGJyPgom
Z3Q7wqAgwqAgwqBpbmNsdWRlL2xpbnV4L3Byb2NfZnMuaDo3OToyNDogbm90ZTogZXhwZWN0ZWQg
JiMzOTtjb25zdCBzdHJ1Y3QgcHJvY19vcHMgKiYjMzk7IGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBl
ICYjMzk7Y29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyAqJiMzOTs8YnI+CiZndDvCoCDCoCDC
oHN0cnVjdCBwcm9jX2Rpcl9lbnRyeSAqcHJvY19jcmVhdGUoY29uc3QgY2hhciAqbmFtZSwgdW1v
ZGVfdCBtb2RlLCBzdHJ1Y3QgcHJvY19kaXJfZW50cnkgKnBhcmVudCwgY29uc3Qgc3RydWN0IHBy
b2Nfb3BzICpwcm9jX29wcyk7PGJyPgomZ3Q7wqAgwqAgwqBefn5+fn5+fn5+fjxicj4KJmd0O8Kg
IMKgIMKga2VybmVsL3JjdS90cmVlLmM6IEluIGZ1bmN0aW9uICYjMzk7cHJfcHJvY193cml0ZSYj
Mzk7Ojxicj4KJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKga2VybmVsL3JjdS90cmVl
LmM6Mzk1NzoxOiB3YXJuaW5nOiBjb250cm9sIHJlYWNoZXMgZW5kIG9mPGJyPgomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqBub24tdm9pZCBmdW5jdGlvbiBbLVdyZXR1cm4tdHlwZV0gPGJyPgomZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqBePGJyPgomZ3Q7wqAgwqAgwqBjYzE6
IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnM8YnI+CiZndDs8YnI+CiZndDvC
oCDCoCDCoHZpbSArL3Byb2NfY3JlYXRlICszOTc5IGtlcm5lbC9yY3UvdHJlZS5jPGJyPgomZ3Q7
PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzkzNcKgIMKgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzkzNsKg
IMKgc3NpemVfdCBwcl9wcm9jX3dyaXRlKHN0cnVjdCBmaWxlICogZiwgY29uc3QgY2hhciBfX3Vz
ZXIgKiBiLCBzaXplX3QgcywgbG9mZl90ICogb2ZmKTxicj4KJmd0O8KgIMKgIMKgIMKgIDM5MzfC
oCDCoHs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTM4wqAgwqAgwqAgwqAgwqAgwqB1NjQgYmVmb3Jl
LCBhZnRlcjs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTM5wqAgwqA8YnI+CiZndDvCoCDCoCDCoCDC
oCAzOTQwwqAgwqAgwqAgwqAgwqAgwqBXUklURV9PTkNFKHdvcmtfdHlwZSwgUEVSQ1BVX1JXU0VN
KTs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTQxwqAgwqByZXBlYXQ6PGJyPgomZ3Q7wqAgwqAgwqAg
wqAgMzk0MsKgIMKgIMKgIMKgIMKgIMKgc21wX21iKCk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk0
M8KgIMKgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk0NMKgIMKgIMKgIMKgIMKgIMKgYmVmb3JlID0g
a3RpbWVfZ2V0X21vbm9fZmFzdF9ucygpOzxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NDXCoCDCoCDC
oCDCoCDCoCDCoGRvX29uZV9wcl90ZXN0KCk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk0NsKgIMKg
IMKgIMKgIMKgIMKgYWZ0ZXIgPSBrdGltZV9nZXRfbW9ub19mYXN0X25zKCk7PGJyPgomZ3Q7wqAg
wqAgwqAgwqAgMzk0N8KgIMKgPGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk0OMKgIMKgIMKgIMKgIMKg
IMKgcHJfZXJyKCZxdW90O1RvdGFsIHRpbWU6ICVsdSB1cyAsIHR5cGU6ICVzXG4mcXVvdDssICh1
bnNpZ25lZCBsb25nKSgoYWZ0ZXIgLSBiZWZvcmUpIC8gMTAwMCksPGJyPgomZ3Q7wqAgwqAgwqAg
wqAgMzk0OcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKHdvcmtfdHlwZSA9PSBQRVJDUFVfUldTRU0gPyAmcXVvdDtwZXJjcHUtcndzZW0mcXVvdDsg
OiAmcXVvdDtyd3NlbSZxdW90OykgKTs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTUwwqAgwqA8YnI+
CiZndDvCoCDCoCDCoCDCoCAzOTUxwqAgwqAgwqAgwqAgwqAgwqBpZiAod29ya190eXBlICE9IFJX
U0VNKSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk1MsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgd29ya190eXBlID0gUldTRU07PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk1M8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbXNsZWVwKDEwMCk7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk1NMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ290byByZXBlYXQ7PGJyPgomZ3Q7wqAgwqAgwqAg
wqAgMzk1NcKgIMKgIMKgIMKgIMKgIMKgfTxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NTbCoCDCoDxi
cj4KJmd0Ozxicj4KJmd0O8KgIMKgIMKgIMKgIMKgMzk1NyB9IDxicj4KJmd0Ozxicj4KJmd0O8Kg
IMKgIMKgIMKgIDM5NTjCoCDCoDxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NTnCoCDCoHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHByX29wcyA9IHs8YnI+CiZndDvCoCDCoCDCoCDC
oCAzOTYwwqAgwqAgwqAgwqAgwqAgwqAud3JpdGUgPSBwcl9wcm9jX3dyaXRlLDxicj4KJmd0O8Kg
IMKgIMKgIMKgIDM5NjHCoCDCoCDCoCDCoCDCoCDCoC5sbHNlZWsgPSBkZWZhdWx0X2xsc2Vlayw8
YnI+CiZndDvCoCDCoCDCoCDCoCAzOTYywqAgwqB9Ozxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NjPC
oCDCoDxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NjTCoCDCoC8qPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
Mzk2NcKgIMKgICogU3Bhd24gYm9vc3Qga3RocmVhZHMgLS0gY2FsbGVkIGFzIHNvb24gYXMgdGhl
IHNjaGVkdWxlciBpcyBydW5uaW5nLjxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NjbCoCDCoCAqLzxi
cj4KJmd0O8KgIMKgIMKgIMKgIDM5NjfCoCDCoHN0YXRpYyB2b2lkIF9faW5pdCByY3Vfc3Bhd25f
cHJfa3RocmVhZHModm9pZCk8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTY4wqAgwqB7PGJyPgomZ3Q7
wqAgwqAgwqAgwqAgMzk2OcKgIMKgIMKgIMKgIMKgIMKgaW50IGNwdTs8YnI+CiZndDvCoCDCoCDC
oCDCoCAzOTcwwqAgwqA8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTcxwqAgwqAgwqAgwqAgwqAgwqBm
b3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KTxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NzLCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBlcl9jcHUocmN1X2RhdGEucmN1X3ByX2hhc193b3JrLCBj
cHUpID0gMDs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTczwqAgwqA8YnI+CiZndDvCoCDCoCDCoCDC
oCAzOTc0wqAgwqAgwqAgwqAgwqAgwqBpZiAoV0FSTl9PTkNFKHNtcGJvb3RfcmVnaXN0ZXJfcGVy
Y3B1X3RocmVhZCgmYW1wO3JjdV9wcl90aHJlYWRfc3BlYyksPGJyPgomZ3Q7wqAgwqAgwqAgwqAg
Mzk3NcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JnF1b3Q7JXM6IENvdWxkIG5vdCBzdGFydCByY3ViIGt0aHJlYWQsIE9PTSBpcyBub3cgZXhwZWN0
ZWQgYmVoYXZpb3JcbiZxdW90OywgX19mdW5jX18pKTxicj4KJmd0O8KgIMKgIMKgIMKgIDM5NzbC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+CiZndDvCoCDCoCDCoCDCoCAz
OTc3wqAgwqA8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTc4wqAgwqAgwqAgwqAgwqAgwqBwcm9jX2Ny
ZWF0ZSgmcXVvdDtwcndfdGVzdCZxdW90OywgMDc3NywgTlVMTCw8YnI+CiZndDs8YnI+CiZndDvC
oCDCoCDCoCDCoCDCoDM5NzkgJmFtcDtwcl9vcHMpOyA8YnI+CiZndDs8YnI+CiZndDvCoCDCoCDC
oCDCoCAzOTgwwqAgwqA8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTgxwqAgwqAgwqAgwqAgwqAgwqAv
Kjxicj4KJmd0O8KgIMKgIMKgIMKgIDM5ODLCoCDCoCDCoCDCoCDCoCDCoGZvcl9lYWNoX29ubGlu
ZV9jcHUoY3B1KSB7PGJyPgomZ3Q7wqAgwqAgwqAgwqAgMzk4M8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcHJfZXJyKCZxdW90O3dha2luZyB1cCB0aHJlYWQgb24gb25saW5lIGNwdSAlZFxu
JnF1b3Q7LCBjcHUpOzxicj4KJmd0O8KgIMKgIMKgIMKgIDM5ODTCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHBlcl9jcHUocmN1X2RhdGEucmN1X3ByX2hhc193b3JrLCBjcHUpID0gMTs8YnI+
CiZndDvCoCDCoCDCoCDCoCAzOTg1wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzbXBfbWIo
KTs8YnI+CiZndDvCoCDCoCDCoCDCoCAzOTg2wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3
YWtlX3VwX3Byb2Nlc3MocGVyX2NwdShyY3VfZGF0YS5wcl9rdGhyZWFkLCBjcHUpKTs8YnI+CiZn
dDvCoCDCoCDCoCDCoCAzOTg3wqAgwqAgwqAgwqAgwqAgwqB9PGJyPgomZ3Q7wqAgwqAgwqAgwqAg
Mzk4OMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+CiZndDvCoCDCoCDCoCDCoCAzOTg5wqAgwqB9PGJy
PgomZ3Q7wqAgwqAgwqAgwqAgMzk5MMKgIMKgPGJyPgomZ3Q7wqAgwqAgwqAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS08YnI+CiZndDvCoCDCoCDCoDAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENv
cnBvcmF0aW9uPGJyPgomZ3Q7wqAgwqAgwqA8YSBocmVmPSJodHRwczovL2xpc3RzLjAxLm9yZy9o
eXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVp
bGQtYWxsQGxpc3RzLjAxLm9yZzwvYT48YnI+CiZndDs8YnI+CiZndDs8YnI+CiZndDsgLS0gPGJy
PgomZ3Q7IFNlbnQgZnJvbSBteSBBbmRyb2lkIGRldmljZSB3aXRoIEstOSBNYWlsLiBQbGVhc2Ug
ZXhjdXNlIG15IGJyZXZpdHkuIDxicj4KPGJyPgo8L2Jsb2NrcXVvdGU+PC9kaXY+Cg==

--===============1175086555750068631==--

