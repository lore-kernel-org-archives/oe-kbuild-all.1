Content-Type: multipart/mixed; boundary="===============4295300930674224247=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/kcsan 12/21] kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assignment (different base types)
Date: Fri, 15 May 2020 22:14:08 +0800
Message-ID: <202005152200.tATtxjIA%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4295300930674224247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/kcsan
head:   ffed638b6a2180da8fd002a46632d746af72b299
commit: bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417 [12/21] READ_ONCE: Simplif=
y implementations of {READ,WRITE}_ONCE()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout bbfa112b46bdbbdfc2f5bfb9c2dcbef780ff6417
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assi=
gnment (different base types) @@    expected int volatile @@    got restric=
ted __poll_int volatile @@
>> kernel/events/ring_buffer.c:22:9: sparse:    expected int volatile
   kernel/events/ring_buffer.c:22:9: sparse:    got restricted __poll_t [us=
ertype]
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types i=
n comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noder=
ef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types i=
n comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noder=
ef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:169:14: sparse: sparse: incompatible types i=
n comparison expression (different address spaces):
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer [noder=
ef] <asn:4> *
   kernel/events/ring_buffer.c:169:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

76369139ceb955 Frederic Weisbecker 2011-05-19  19  =

76369139ceb955 Frederic Weisbecker 2011-05-19  20  static void perf_output_=
wakeup(struct perf_output_handle *handle)
76369139ceb955 Frederic Weisbecker 2011-05-19  21  {
a9a08845e9acbd Linus Torvalds      2018-02-11 @22  	atomic_set(&handle->rb-=
>poll, EPOLLIN);
76369139ceb955 Frederic Weisbecker 2011-05-19  23  =

76369139ceb955 Frederic Weisbecker 2011-05-19  24  	handle->event->pending_=
wakeup =3D 1;
76369139ceb955 Frederic Weisbecker 2011-05-19  25  	irq_work_queue(&handle-=
>event->pending);
76369139ceb955 Frederic Weisbecker 2011-05-19  26  }
76369139ceb955 Frederic Weisbecker 2011-05-19  27  =


:::::: The code at line 22 was first introduced by commit
:::::: a9a08845e9acbd224e4ee466f5c1275ed50054e8 vfs: do bulk POLL* -> EPOLL=
* replacement

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4295300930674224247==--

