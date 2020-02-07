Content-Type: multipart/mixed; boundary="===============0426686042242859608=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/core 10/18] kernel/locking/osq_lock.c:78:7: error: implicit declaration of function 'data_race'
Date: Sat, 08 Feb 2020 03:40:34 +0800
Message-ID: <202002080332.7PLR0cWX%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0426686042242859608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/core
head:   3632aa63d7b6bf773a5ba00e06415a144ffd25d1
commit: 6bf619166f87b59e2bffc68f34f2b2056bb2483c [10/18] locking/osq_lock: =
mark an intentional data race
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6bf619166f87b59e2bffc68f34f2b2056bb2483c
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/locking/osq_lock.c: In function 'osq_wait_next':
>> kernel/locking/osq_lock.c:78:7: error: implicit declaration of function =
'data_race' [-Werror=3Dimplicit-function-declaration]
      78 |   if (data_race(node->next)) {
         |       ^~~~~~~~~
   cc1: some warnings being treated as errors

vim +/data_race +78 kernel/locking/osq_lock.c

    36	=

    37	/*
    38	 * Get a stable @node->next pointer, either for unlock() or unqueue(=
) purposes.
    39	 * Can return NULL in case we were the last queued and we updated @l=
ock instead.
    40	 */
    41	static inline struct optimistic_spin_node *
    42	osq_wait_next(struct optimistic_spin_queue *lock,
    43		      struct optimistic_spin_node *node,
    44		      struct optimistic_spin_node *prev)
    45	{
    46		struct optimistic_spin_node *next =3D NULL;
    47		int curr =3D encode_cpu(smp_processor_id());
    48		int old;
    49	=

    50		/*
    51		 * If there is a prev node in queue, then the 'old' value will be
    52		 * the prev node's CPU #, else it's set to OSQ_UNLOCKED_VAL since if
    53		 * we're currently last in queue, then the queue will then become e=
mpty.
    54		 */
    55		old =3D prev ? prev->cpu : OSQ_UNLOCKED_VAL;
    56	=

    57		for (;;) {
    58			if (atomic_read(&lock->tail) =3D=3D curr &&
    59			    atomic_cmpxchg_acquire(&lock->tail, curr, old) =3D=3D curr) {
    60				/*
    61				 * We were the last queued, we moved @lock back. @prev
    62				 * will now observe @lock and will complete its
    63				 * unlock()/unqueue().
    64				 */
    65				break;
    66			}
    67	=

    68			/*
    69			 * We must xchg() the @node->next value, because if we were to
    70			 * leave it in, a concurrent unlock()/unqueue() from
    71			 * @node->next might complete Step-A and think its @prev is
    72			 * still valid.
    73			 *
    74			 * If the concurrent unlock()/unqueue() wins the race, we'll
    75			 * wait for either @lock to point to us, through its Step-B, or
    76			 * wait for a new @node->next from its Step-C.
    77			 */
  > 78			if (data_race(node->next)) {
    79				next =3D xchg(&node->next, NULL);
    80				if (next)
    81					break;
    82			}
    83	=

    84			cpu_relax();
    85		}
    86	=

    87		return next;
    88	}
    89	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0426686042242859608==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
A/uNy2syigAA
--===============0426686042242859608==--

