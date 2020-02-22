Content-Type: multipart/mixed; boundary="===============7246971793788469025=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [fscrypt:inline-encryption 3/9] kernel/trace/blktrace.c:234:17: sparse: sparse: shift count is negative (-1)
Date: Sat, 22 Feb 2020 12:00:25 +0800
Message-ID: <202002221213.B1vSi9UI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7246971793788469025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git inline-encryp=
tion
head:   e2a886cbde4e86d77725c8811b7e775541a5d453
commit: 3cde4aecbe31f156590c00d7093b938e609f05d2 [3/9] block: blk-crypto-fa=
llback for Inline Encryption
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 3cde4aecbe31f156590c00d7093b938e609f05d2
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/trace/blktrace.c:969:50: sparse: sparse: incorrect type in argume=
nt 7 (different base types)
   kernel/trace/blktrace.c:969:50: sparse:    expected int error
   kernel/trace/blktrace.c:969:50: sparse:    got restricted blk_status_t [=
usertype] bi_status
   kernel/trace/blktrace.c:1002:68: sparse: sparse: incorrect type in argum=
ent 7 (different base types)
   kernel/trace/blktrace.c:1002:68: sparse:    expected int error
   kernel/trace/blktrace.c:1002:68: sparse:    got restricted blk_status_t =
[usertype] bi_status
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1212:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1219:32: sparse: sparse: incorrect type in initi=
alizer (different base types)
   kernel/trace/blktrace.c:1219:32: sparse:    expected unsigned long long =
[usertype] sector_from
   kernel/trace/blktrace.c:1219:32: sparse:    got restricted __be64 const =
[usertype] sector_from
   kernel/trace/blktrace.c:1221:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1221:24: sparse:    expected restricted __be32 [=
usertype] device_from
   kernel/trace/blktrace.c:1221:24: sparse:    got unsigned int
   kernel/trace/blktrace.c:1222:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1222:24: sparse:    expected restricted __be32 [=
usertype] device_to
   kernel/trace/blktrace.c:1222:24: sparse:    got unsigned int
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1223:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1223:24: sparse:    expected restricted __be64 [=
usertype] sector_from
   kernel/trace/blktrace.c:1223:24: sparse:    got unsigned long long
   kernel/trace/blktrace.c:1370:26: sparse: sparse: restricted __be32 degra=
des to integer
   kernel/trace/blktrace.c:1370:48: sparse: sparse: restricted __be32 degra=
des to integer
   kernel/trace/blktrace.c:1371:27: sparse: sparse: cast from restricted __=
be64
>> kernel/trace/blktrace.c:234:17: sparse: sparse: shift count is negative =
(-1)

vim +234 kernel/trace/blktrace.c

7b6d91daee5cac kernel/trace/blktrace.c Christoph Hellwig        2010-08-07 =
 203  =

35ba8f7083e876 block/blktrace.c        David Woodhouse          2008-08-10 =
 204  /* The ilog2() calls fall out because they're constant */
7b6d91daee5cac kernel/trace/blktrace.c Christoph Hellwig        2010-08-07 =
 205  #define MASK_TC_BIT(rw, __name) ((rw & REQ_ ## __name) << \
7b6d91daee5cac kernel/trace/blktrace.c Christoph Hellwig        2010-08-07 =
 206  	  (ilog2(BLK_TC_ ## __name) + BLK_TC_SHIFT - __REQ_ ## __name))
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 207  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 208  /*
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 209   * The worker for the various blk_add_trace*() types. Fills out a
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 210   * blk_io_trace structure and places it in a per-cpu subbuffer.
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 211   */
5f3ea37c7716db block/blktrace.c        Arnaldo Carvalho de Melo 2008-10-30 =
 212  static void __blk_add_trace(struct blk_trace *bt, sector_t sector, in=
t bytes,
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 213  		     int op, int op_flags, u32 what, int error, int pdu_len,
67c0496e87d193 kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
 214  		     void *pdu_data, u64 cgid)
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 215  {
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 216  	struct task_struct *tsk =3D current;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 217  	struct ring_buffer_event *event =3D NULL;
13292494379f92 kernel/trace/blktrace.c Steven Rostedt (VMware   2019-12-13 =
 218) 	struct trace_buffer *buffer =3D NULL;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 219  	struct blk_io_trace *t;
0a9877514c4fed block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-05 =
 220  	unsigned long flags =3D 0;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 221  	unsigned long *sequence;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 222  	pid_t pid;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 223  	int cpu, pc =3D 0;
18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 224  	bool blk_tracer =3D blk_tracer_enabled;
67c0496e87d193 kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
 225  	ssize_t cgid_len =3D cgid ? sizeof(cgid) : 0;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 226  =

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 227  	if (unlikely(bt->trace_state !=3D Blktrace_running && !blk_tracer))
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 228  		return;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 229  =

1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 230  	what |=3D ddir_act[op_is_write(op) ? WRITE : READ];
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 231  	what |=3D MASK_TC_BIT(op_flags, SYNC);
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 232  	what |=3D MASK_TC_BIT(op_flags, RAHEAD);
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 233  	what |=3D MASK_TC_BIT(op_flags, META);
28a8f0d317bf22 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
@234  	what |=3D MASK_TC_BIT(op_flags, PREFLUSH);
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 235  	what |=3D MASK_TC_BIT(op_flags, FUA);
7afafc8a44bf0a kernel/trace/blktrace.c Adrian Hunter            2016-08-16 =
 236  	if (op =3D=3D REQ_OP_DISCARD || op =3D=3D REQ_OP_SECURE_ERASE)
1b9a9ab78b0ab7 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 237  		what |=3D BLK_TC_ACT(BLK_TC_DISCARD);
3a5e02ced11e22 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 238  	if (op =3D=3D REQ_OP_FLUSH)
3a5e02ced11e22 kernel/trace/blktrace.c Mike Christie            2016-06-05 =
 239  		what |=3D BLK_TC_ACT(BLK_TC_FLUSH);
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 240  	if (cgid)
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 241  		what |=3D __BLK_TA_CGROUP;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 242  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 243  	pid =3D tsk->pid;
d0deef5b14af7d kernel/trace/blktrace.c Shawn Du                 2009-04-14 =
 244  	if (act_log_check(bt, what, sector, pid))
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 245  		return;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 246  	cpu =3D raw_smp_processor_id();
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 247  =

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 248  	if (blk_tracer) {
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 249  		tracing_record_cmdline(current);
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 250  =

1c5eb4481e0151 kernel/trace/blktrace.c Steven Rostedt (VMware   2020-01-09 =
 251) 		buffer =3D blk_tr->array_buffer.buffer;
51a763dd84253b block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-05 =
 252  		pc =3D preempt_count();
e77405ad80f539 kernel/trace/blktrace.c Steven Rostedt           2009-09-02 =
 253  		event =3D trace_buffer_lock_reserve(buffer, TRACE_BLK,
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 254  						  sizeof(*t) + pdu_len + cgid_len,
51a763dd84253b block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-05 =
 255  						  0, pc);
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 256  		if (!event)
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 257  			return;
51a763dd84253b block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-05 =
 258  		t =3D ring_buffer_event_data(event);
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 259  		goto record_it;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 260  	}
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 261  =

a404d5576bbe58 kernel/trace/blktrace.c Jan Kara                 2013-09-17 =
 262  	if (unlikely(tsk->btrace_seq !=3D blktrace_seq))
a404d5576bbe58 kernel/trace/blktrace.c Jan Kara                 2013-09-17 =
 263  		trace_note_tsk(tsk);
a404d5576bbe58 kernel/trace/blktrace.c Jan Kara                 2013-09-17 =
 264  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 265  	/*
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 266  	 * A word about the locking here - we disable interrupts to reserve
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 267  	 * some space in the relay per-cpu buffer, to prevent an irq
14a73f54798f39 block/blktrace.c        Carl Henrik Lunde        2008-06-12 =
 268  	 * from coming in and stepping on our toes.
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 269  	 */
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 270  	local_irq_save(flags);
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 271  	t =3D relay_reserve(bt->rchan, sizeof(*t) + pdu_len + cgid_len);
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 272  	if (t) {
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 273  		sequence =3D per_cpu_ptr(bt->sequence, cpu);
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 274  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 275  		t->magic =3D BLK_IO_TRACE_MAGIC | BLK_IO_TRACE_VERSION;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 276  		t->sequence =3D ++(*sequence);
2997c8c4a0b179 block/blktrace.c        Ingo Molnar              2008-01-11 =
 277  		t->time =3D ktime_to_ns(ktime_get());
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 278  record_it:
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 279  		/*
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 280  		 * These two are not needed in ftrace as they are in the
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 281  		 * generic trace_entry, filled by tracing_generic_entry_update,
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 282  		 * but for the trace_event->bin() synthesizer benefit we do it
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 283  		 * here too.
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 284  		 */
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 285  		t->cpu =3D cpu;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 286  		t->pid =3D pid;
08a06b83ff8b27 block/blktrace.c        Arnaldo Carvalho de Melo 2009-02-02 =
 287  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 288  		t->sector =3D sector;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 289  		t->bytes =3D bytes;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 290  		t->action =3D what;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 291  		t->device =3D bt->dev;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 292  		t->error =3D error;
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 293  		t->pdu_len =3D pdu_len + cgid_len;
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 294  =

ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 295  		if (cgid_len)
67c0496e87d193 kernel/trace/blktrace.c Tejun Heo                2019-11-04 =
 296  			memcpy((void *)t + sizeof(*t), &cgid, cgid_len);
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 297  		if (pdu_len)
ca1136c99b66b1 kernel/trace/blktrace.c Shaohua Li               2017-07-12 =
 298  			memcpy((void *)t + sizeof(*t) + cgid_len, pdu_data, pdu_len);
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 299  =

18cea4591a9881 kernel/trace/blktrace.c Li Zefan                 2009-03-27 =
 300  		if (blk_tracer) {
b7f0c959edfb44 kernel/trace/blktrace.c Steven Rostedt (Red Hat  2015-09-25 =
 301) 			trace_buffer_unlock_commit(blk_tr, buffer, event, 0, pc);
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 302  			return;
c71a896154119f block/blktrace.c        Arnaldo Carvalho de Melo 2009-01-23 =
 303  		}
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 304  	}
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 305  =

2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 306  	local_irq_restore(flags);
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 307  }
2056a782f8e7e6 block/blktrace.c        Jens Axboe               2006-03-23 =
 308  =


:::::: The code at line 234 was first introduced by commit
:::::: 28a8f0d317bf225ff15008f5dd66ae16242dd843 block, drivers, fs: rename =
REQ_FLUSH to REQ_PREFLUSH

:::::: TO: Mike Christie <mchristi@redhat.com>
:::::: CC: Jens Axboe <axboe@fb.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7246971793788469025==--

