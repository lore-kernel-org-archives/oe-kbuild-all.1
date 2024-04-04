Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C8A21
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712190264; cv=none; b=sOQgDysBfkhC2DKu2U9RElL+HvnqyYJRbvBT4dS70m3oniobOE+p9jvIiq34rKcOeUYFomWUytuWhUTMoJqfI2DEcWrUFLjX1/dBjmVCW4tHuhdNnG2j5jj7g58Ct6fMaIZL7JCflVv6UmJSDGDNxtr8J5izpGzHSxcCUhjaggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712190264; c=relaxed/simple;
	bh=4OlDamCq5igRp7fEidBVfr+KswEK8m2ywZuZwm0Tpss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrEil14iwEXJIOJ4zOVBlwatyMv3NkNjCgAIsWqhjpZaDO3yitBpQDVG74YlJiBOjUs20oLJaF7BWPm9ysPpnKK2n8TmsXjf0hYMBfTBogZB7mzVs32j+GVLn1ZwwoZ+rTQnENDkFzO4228dm/mKHU0+455FUv7XlGw4phifZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtEIXUGA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtEIXUGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712190262; x=1743726262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OlDamCq5igRp7fEidBVfr+KswEK8m2ywZuZwm0Tpss=;
  b=NtEIXUGAL1jgG3aHwry/ROJbZZCwKuN1OoTd1xk/Y9BD+wYSdB22D9cW
   9woZ3/HBFwORK1l0/NJOZamqDPGRvHoOkYGeYVSDA3q2lQ9je0gfMFQ4p
   pUHNazAEhxQBV34/Nf/DF6D7jUC+1W9njcAFDjo1K8d69FoyYxGOW3332
   2ta+ureFHV0BNTAjul1RYsRJdMQmk5q9LlKBD7Pf219m/xsM1510d8NaV
   ZUEndaZ/kpFXdOlRgJ+2on3DS1URNVSpAcKTNbAOZxdN7eZe28l9DaWbc
   4VjcXeFjg9s0E5xlKF4jBx05FqACo3d9niJTp1saDfAFyV5Ap9LyVsR9J
   g==;
X-CSE-ConnectionGUID: KirPeweNRJyOFHuq/6s8pw==
X-CSE-MsgGUID: k27Dres1QW6ZxyBJDS7zZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="8032807"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="8032807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 17:24:19 -0700
X-CSE-ConnectionGUID: 3sS6jQF2ToW2rfzXDNoHKQ==
X-CSE-MsgGUID: nsN3KvXoRgiYATEyOYpl1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56063558"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 17:24:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsAts-0000Oe-0u;
	Thu, 04 Apr 2024 00:24:16 +0000
Date: Thu, 4 Apr 2024 08:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 4/12] drivers/char/dtlk.c:104:27: error:
 'dtlk_read_iter' undeclared here (not in a function); did you mean
 'call_read_iter'?
Message-ID: <202404040858.zssYWvPN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e8fd62fac9e105d05cfda66070e98a3a255e1a0
commit: fe9c21429562ac632f44a86feb722e07aaa1c91e [4/12] char: convert drivers to use ->read_iter() and ->write_iter()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240404/202404040858.zssYWvPN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040858.zssYWvPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040858.zssYWvPN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/char/dtlk.c:104:27: error: 'dtlk_read_iter' undeclared here (not in a function); did you mean 'call_read_iter'?
     104 |         .read_iter      = dtlk_read_iter,
         |                           ^~~~~~~~~~~~~~
         |                           call_read_iter
>> drivers/char/dtlk.c:105:27: error: 'dtlk_write_iter' undeclared here (not in a function); did you mean 'call_write_iter'?
     105 |         .write_iter     = dtlk_write_iter,
         |                           ^~~~~~~~~~~~~~~
         |                           call_write_iter
>> drivers/char/dtlk.c:237:16: warning: 'dtlk_write_iter' defined but not used [-Wunused-function]
     237 | static ssize_t dtlk_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~
>> drivers/char/dtlk.c:159:16: warning: 'dtlk_read_iter' defined but not used [-Wunused-function]
     159 | static ssize_t dtlk_read_iter(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~~~~~~~


vim +104 drivers/char/dtlk.c

    89	
    90	/* prototypes for file_operations struct */
    91	static ssize_t dtlk_read(struct file *, char __user *,
    92				 size_t nbytes, loff_t * ppos);
    93	static ssize_t dtlk_write(struct file *, const char __user *,
    94				  size_t nbytes, loff_t * ppos);
    95	static __poll_t dtlk_poll(struct file *, poll_table *);
    96	static int dtlk_open(struct inode *, struct file *);
    97	static int dtlk_release(struct inode *, struct file *);
    98	static long dtlk_ioctl(struct file *file,
    99			       unsigned int cmd, unsigned long arg);
   100	
   101	static const struct file_operations dtlk_fops =
   102	{
   103		.owner		= THIS_MODULE,
 > 104		.read_iter	= dtlk_read_iter,
 > 105		.write_iter	= dtlk_write_iter,
   106		.poll		= dtlk_poll,
   107		.unlocked_ioctl	= dtlk_ioctl,
   108		.open		= dtlk_open,
   109		.release	= dtlk_release,
   110		.llseek		= no_llseek,
   111	};
   112	
   113	/* local prototypes */
   114	static int dtlk_dev_probe(void);
   115	static struct dtlk_settings *dtlk_interrogate(void);
   116	static int dtlk_readable(void);
   117	static char dtlk_read_lpc(void);
   118	static char dtlk_read_tts(void);
   119	static int dtlk_writeable(void);
   120	static char dtlk_write_bytes(const char *buf, int n);
   121	static char dtlk_write_tts(char);
   122	/*
   123	   static void dtlk_handle_error(char, char, unsigned int);
   124	 */
   125	
   126	static ssize_t dtlk_read(struct file *file, char __user *buf,
   127				 size_t count, loff_t * ppos)
   128	{
   129		unsigned int minor = iminor(file_inode(file));
   130		char ch;
   131		int i = 0, retries;
   132	
   133		TRACE_TEXT("(dtlk_read");
   134		/*  printk("DoubleTalk PC - dtlk_read()\n"); */
   135	
   136		if (minor != DTLK_MINOR || !dtlk_has_indexing)
   137			return -EINVAL;
   138	
   139		for (retries = 0; retries < loops_per_jiffy; retries++) {
   140			while (i < count && dtlk_readable()) {
   141				ch = dtlk_read_lpc();
   142				/*        printk("dtlk_read() reads 0x%02x\n", ch); */
   143				if (put_user(ch, buf++))
   144					return -EFAULT;
   145				i++;
   146			}
   147			if (i)
   148				return i;
   149			if (file->f_flags & O_NONBLOCK)
   150				break;
   151			msleep_interruptible(100);
   152		}
   153		if (retries == loops_per_jiffy)
   154			printk(KERN_ERR "dtlk_read times out\n");
   155		TRACE_RET;
   156		return -EAGAIN;
   157	}
   158	
 > 159	static ssize_t dtlk_read_iter(struct kiocb *iocb, struct iov_iter *to)
   160	{
   161		return vfs_read_iter(iocb, to, dtlk_read);
   162	}
   163	
   164	static ssize_t dtlk_write(struct file *file, const char __user *buf,
   165				  size_t count, loff_t * ppos)
   166	{
   167		int i = 0, retries = 0, ch;
   168	
   169		TRACE_TEXT("(dtlk_write");
   170	#ifdef TRACING
   171		printk(" \"");
   172		{
   173			int i, ch;
   174			for (i = 0; i < count; i++) {
   175				if (get_user(ch, buf + i))
   176					return -EFAULT;
   177				if (' ' <= ch && ch <= '~')
   178					printk("%c", ch);
   179				else
   180					printk("\\%03o", ch);
   181			}
   182			printk("\"");
   183		}
   184	#endif
   185	
   186		if (iminor(file_inode(file)) != DTLK_MINOR)
   187			return -EINVAL;
   188	
   189		while (1) {
   190			while (i < count && !get_user(ch, buf) &&
   191			       (ch == DTLK_CLEAR || dtlk_writeable())) {
   192				dtlk_write_tts(ch);
   193				buf++;
   194				i++;
   195				if (i % 5 == 0)
   196					/* We yield our time until scheduled
   197					   again.  This reduces the transfer
   198					   rate to 500 bytes/sec, but that's
   199					   still enough to keep up with the
   200					   speech synthesizer. */
   201					msleep_interruptible(1);
   202				else {
   203					/* the RDY bit goes zero 2-3 usec
   204					   after writing, and goes 1 again
   205					   180-190 usec later.  Here, we wait
   206					   up to 250 usec for the RDY bit to
   207					   go nonzero. */
   208					for (retries = 0;
   209					     retries < loops_per_jiffy / (4000/HZ);
   210					     retries++)
   211						if (inb_p(dtlk_port_tts) &
   212						    TTS_WRITABLE)
   213							break;
   214				}
   215				retries = 0;
   216			}
   217			if (i == count)
   218				return i;
   219			if (file->f_flags & O_NONBLOCK)
   220				break;
   221	
   222			msleep_interruptible(1);
   223	
   224			if (++retries > 10 * HZ) { /* wait no more than 10 sec
   225						      from last write */
   226				printk("dtlk: write timeout.  "
   227				       "inb_p(dtlk_port_tts) = 0x%02x\n",
   228				       inb_p(dtlk_port_tts));
   229				TRACE_RET;
   230				return -EBUSY;
   231			}
   232		}
   233		TRACE_RET;
   234		return -EAGAIN;
   235	}
   236	
 > 237	static ssize_t dtlk_write_iter(struct kiocb *iocb, struct iov_iter *from)
   238	{
   239		return vfs_write_iter(iocb, from, dtlk_write);
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
