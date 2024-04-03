Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD15B14C5B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712178214; cv=none; b=pi2ANybwbIQSf7XvVif+dLgaSjp5aiWKwX6dwJrf60FQDIf+DRSpywoVx7xiQkooGobisVaztXIPTh99wbbAxCU4JxM/RI7y9vRpztZxbBPFgzwzQYYwNQrR7qUhF/QQazHTGQjcGzJf7FLKgCXFLEJdiPs/P1ibKxHI/wMnDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712178214; c=relaxed/simple;
	bh=Pe1fbBoLU/tnE5DnZdKXCgf7ET7C5niHlUZdCVbYyFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buvM/YY+uTLDa360PMi/7gMoWwXmIHnY6Lf8rMU5bLJsxGCCkS//1SNMLKPmuB/9gg+mq3XEN0V7p/k01L5etoFMQm+3PW6ImtSoJK6mofasvFcZQShmIGJrvqeHSrn6xtVTEHKnEXqAfr9gq16tMHd3DRlB49K89XJXzsQ2UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGTPUk1I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGTPUk1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712178213; x=1743714213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pe1fbBoLU/tnE5DnZdKXCgf7ET7C5niHlUZdCVbYyFw=;
  b=SGTPUk1Im9idOdJpUEDEOhYHLTQ9fB6JD3hCPUIgYv/2QnyemBj+H87o
   5qGmFubuDlV6QFJ11gQsCIOtS14pqbwG6gOXCpMHVxIXL4m8GFcatWwvQ
   ISvnOkgMD4r/FCUeh1fm2uFCl1N6DNy4kD16puQ+qr9hgUPUIhrx6YNLN
   xlADdotyxSL8LB9nKExw1+NaEmZtGNhc6ix3j2ZuvV+DcyPXqAKXs7jZ2
   00KMZ8qPoOxm6+mNQYYnBEBW4JNhXb1ybcjC21i94bfa+tAeWq3cmmZgD
   JZQgVbQTocf2kpGgCd2EyKmJu8n+CeTajjEwoWHsVDvB3soU128XNq6Ow
   A==;
X-CSE-ConnectionGUID: ru/k1DK/T/i+NafbvQNHlg==
X-CSE-MsgGUID: TLVARk+LQBiLGH4Ow/8v1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18796428"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18796428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 14:03:32 -0700
X-CSE-ConnectionGUID: Yc5JzVZbRnuzKJjJJc6iOA==
X-CSE-MsgGUID: HzqgkZ8HTTesG3KG/TXKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18673169"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2024 14:03:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs7lG-0000EU-2C;
	Wed, 03 Apr 2024 21:03:10 +0000
Date: Thu, 4 Apr 2024 05:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 4/10] drivers/char/adi.c:220:27: error:
 initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka
 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer
 type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long ...
Message-ID: <202404040452.HB0Pp72q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8b68c0bba37e427ceb23ae39861ba6816fdec1f9
commit: fe9c21429562ac632f44a86feb722e07aaa1c91e [4/10] char: convert drivers to use ->read_iter() and ->write_iter()
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240404/202404040452.HB0Pp72q-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040452.HB0Pp72q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040452.HB0Pp72q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/char/adi.c:220:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     220 |         .read_iter      = adi_read,
         |                           ^~~~~~~~
   drivers/char/adi.c:220:27: note: (near initialization for 'adi_fops.read_iter')
>> drivers/char/adi.c:221:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     221 |         .write_iter     = adi_write,
         |                           ^~~~~~~~~
   drivers/char/adi.c:221:27: note: (near initialization for 'adi_fops.write_iter')
>> drivers/char/adi.c:182:16: warning: 'adi_write_iter' defined but not used [-Wunused-function]
     182 | static ssize_t adi_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~
>> drivers/char/adi.c:101:16: warning: 'adi_read_iter' defined but not used [-Wunused-function]
     101 | static ssize_t adi_read_iter(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +220 drivers/char/adi.c

   100	
 > 101	static ssize_t adi_read_iter(struct kiocb *iocb, struct iov_iter *to)
   102	{
   103		return vfs_read_iter(iocb, to, adi_read);
   104	}
   105	
   106	static int set_mcd_tag(unsigned long addr, u8 ver)
   107	{
   108		long err;
   109	
   110		__asm__ __volatile__(
   111			"1:	stxa %[ver], [%[addr]] %[asi]\n"
   112			"	mov 0, %[err]\n"
   113			"2:\n"
   114			"	.section .fixup,#alloc,#execinstr\n"
   115			"	.align 4\n"
   116			"3:	sethi %%hi(2b), %%g1\n"
   117			"	jmpl %%g1 + %%lo(2b), %%g0\n"
   118			"	mov %[invalid], %[err]\n"
   119			"	.previous\n"
   120			"	.section __ex_table, \"a\"\n"
   121			"	.align 4\n"
   122			"	.word 1b, 3b\n"
   123			"	.previous\n"
   124			: [err] "=r" (err)
   125			: [ver] "r" (ver), [addr] "r"  (addr),
   126			  [invalid] "i" (EFAULT), [asi] "i" (ASI_MCD_REAL)
   127			: "memory", "g1"
   128			);
   129	
   130		if (err)
   131			return -EFAULT;
   132		else
   133			return ver;
   134	}
   135	
   136	static ssize_t adi_write(struct file *file, const char __user *buf,
   137				 size_t count, loff_t *offp)
   138	{
   139		size_t ver_buf_sz, bytes_written = 0;
   140		loff_t offset;
   141		u8 *ver_buf;
   142		ssize_t ret;
   143		int i;
   144	
   145		if (count <= 0)
   146			return -EINVAL;
   147	
   148		ver_buf_sz = min_t(size_t, count, MAX_BUF_SZ);
   149		ver_buf = kmalloc(ver_buf_sz, GFP_KERNEL);
   150		if (!ver_buf)
   151			return -ENOMEM;
   152	
   153		offset = (*offp) * adi_blksize();
   154	
   155		do {
   156			if (copy_from_user(ver_buf, &buf[bytes_written],
   157					   ver_buf_sz)) {
   158				ret = -EFAULT;
   159				goto out;
   160			}
   161	
   162			for (i = 0; i < ver_buf_sz; i++) {
   163				ret = set_mcd_tag(offset, ver_buf[i]);
   164				if (ret < 0)
   165					goto out;
   166	
   167				offset += adi_blksize();
   168			}
   169	
   170			bytes_written += ver_buf_sz;
   171			ver_buf_sz = min(count - bytes_written, (size_t)MAX_BUF_SZ);
   172		} while (bytes_written < count);
   173	
   174		(*offp) += bytes_written;
   175		ret = bytes_written;
   176	out:
   177		__asm__ __volatile__("membar #Sync");
   178		kfree(ver_buf);
   179		return ret;
   180	}
   181	
 > 182	static ssize_t adi_write_iter(struct kiocb *iocb, struct iov_iter *from)
   183	{
   184		return vfs_write_iter(iocb, from, adi_write);
   185	}
   186	
   187	static loff_t adi_llseek(struct file *file, loff_t offset, int whence)
   188	{
   189		loff_t ret = -EINVAL;
   190	
   191		switch (whence) {
   192		case SEEK_END:
   193		case SEEK_DATA:
   194		case SEEK_HOLE:
   195			/* unsupported */
   196			return -EINVAL;
   197		case SEEK_CUR:
   198			if (offset == 0)
   199				return file->f_pos;
   200	
   201			offset += file->f_pos;
   202			break;
   203		case SEEK_SET:
   204			break;
   205		}
   206	
   207		if (offset != file->f_pos) {
   208			file->f_pos = offset;
   209			file->f_version = 0;
   210			ret = offset;
   211		}
   212	
   213		return ret;
   214	}
   215	
   216	static const struct file_operations adi_fops = {
   217		.owner		= THIS_MODULE,
   218		.llseek		= adi_llseek,
   219		.open		= adi_open,
 > 220		.read_iter	= adi_read,
 > 221		.write_iter	= adi_write,
   222	};
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
