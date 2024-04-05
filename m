Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCE616F858
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335498; cv=none; b=Sebls9i1zBK/kPaBjooTdvZHIlWVFjThX6VfX1E55ozM+ACiOhrylhf+NcoJwA+qNC2NREXGbCfqv0OdJ4PzjyvFjBX9R5B4UwGbP41NUe+mNkRmPWjEgdsTHJ7Rl+6LZ9MPn9bdrjnNcwmkj/pde+rPqC5voD3FnW7JJupaV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335498; c=relaxed/simple;
	bh=7k9h0NE9EXOpR5turkS0EZ0Jti1KeMqYMXQI/jLdrcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJJqOy7otpcxazW2IsdfgRvvrMNwFzFTWGKV2nCSrjFfMcIfUCnwbrTbl+fheja4pA+SmyOnlNMKwfVTlgi7A7pwMe0PPoBUKXxdIndonmTbGphg3tWBYpY6EO0btna1WF7p+BVheodDuyol0TLvugykg3EgoASdW/460oomZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uui1Dr7l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uui1Dr7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712335497; x=1743871497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7k9h0NE9EXOpR5turkS0EZ0Jti1KeMqYMXQI/jLdrcc=;
  b=Uui1Dr7lvvUF5TguGZJsGx5uHcK9+MQQghz7XbR5JJPW17hov9AAY7HX
   /F7TOXyNPw7k8+bGm/IZpQchFY7Cj4jA8sRYAwp+3mfYCjacOzEbIkQjm
   O+V8hEQq7/xBLyxbjwd5J4nuqiLotwz3m4trozu2xON47DOOmXIOSOVSQ
   D+HvPDsQ9E7SO8Jye6TrxxgnNVYfdCyPPhrSgHRZRWck7OTQY64VWIMLz
   7zpLfUr3VvoERyFifL0BzCqpxyr8LtUgAZJqL+d4jQUJn1M2b/ATOHq/1
   SVAUFr51AaOLazHKxYKXub0gAVzO2nzehUyEaIT/AuyjDzEYbtCNj3guS
   Q==;
X-CSE-ConnectionGUID: fh75pK1wQRme3pLI4WV7MA==
X-CSE-MsgGUID: 58gsSnsgRhSb9S40FZjYdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="33073528"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="33073528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:44:56 -0700
X-CSE-ConnectionGUID: 1HVjq55cSFKZZ65Bgrw63w==
X-CSE-MsgGUID: qF9Q9Ms7T46GrhaB8t3Mew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19299339"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2024 09:44:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsmgO-0002W7-24;
	Fri, 05 Apr 2024 16:44:52 +0000
Date: Sat, 6 Apr 2024 00:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 40/40] drivers/xen/evtchn.c:205:24: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404060039.PEQbpv7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   a9cbf952fcac761bffbb44eab7d5ef86b310c71c
commit: a9cbf952fcac761bffbb44eab7d5ef86b310c71c [40/40] drivers/xen: convert to ->read_iter and ->write_iter
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060039.PEQbpv7q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060039.PEQbpv7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060039.PEQbpv7q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/evtchn.c: In function 'evtchn_read':
>> drivers/xen/evtchn.c:205:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     205 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> drivers/xen/evtchn.c:259:14: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     259 |         if (!copy_to_iter_full(evtchn_ring_entry(u, c), bytes1, to) ||
         |              ^~~~~~~~~~~~~~~~~
         |              copy_to_user_nofault
   drivers/xen/evtchn.c: In function 'evtchn_write':
>> drivers/xen/evtchn.c:293:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     293 |         if (!copy_from_iter_full(kbuf, count, from) != 0)
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   cc1: some warnings being treated as errors


vim +/iov_iter_count +205 drivers/xen/evtchn.c

   199	
   200	static ssize_t evtchn_read(struct kiocb *iocb, struct iov_iter *to)
   201	{
   202		int rc;
   203		unsigned int c, p, bytes1 = 0, bytes2 = 0;
   204		struct per_user_data *u = iocb->ki_filp->private_data;
 > 205		size_t count = iov_iter_count(to);
   206	
   207		/* Whole number of ports. */
   208		count &= ~(sizeof(evtchn_port_t)-1);
   209	
   210		if (count == 0)
   211			return 0;
   212	
   213		if (count > PAGE_SIZE)
   214			count = PAGE_SIZE;
   215	
   216		for (;;) {
   217			mutex_lock(&u->ring_cons_mutex);
   218	
   219			rc = -EFBIG;
   220			if (u->ring_overflow)
   221				goto unlock_out;
   222	
   223			c = READ_ONCE(u->ring_cons);
   224			p = READ_ONCE(u->ring_prod);
   225			if (c != p)
   226				break;
   227	
   228			mutex_unlock(&u->ring_cons_mutex);
   229	
   230			if (iocb->ki_filp->f_flags & O_NONBLOCK)
   231				return -EAGAIN;
   232	
   233			rc = wait_event_interruptible(u->evtchn_wait,
   234				READ_ONCE(u->ring_cons) != READ_ONCE(u->ring_prod));
   235			if (rc)
   236				return rc;
   237		}
   238	
   239		/* Byte lengths of two chunks. Chunk split (if any) is at ring wrap. */
   240		if (((c ^ p) & u->ring_size) != 0) {
   241			bytes1 = (u->ring_size - evtchn_ring_offset(u, c)) *
   242				sizeof(evtchn_port_t);
   243			bytes2 = evtchn_ring_offset(u, p) * sizeof(evtchn_port_t);
   244		} else {
   245			bytes1 = (p - c) * sizeof(evtchn_port_t);
   246			bytes2 = 0;
   247		}
   248	
   249		/* Truncate chunks according to caller's maximum byte count. */
   250		if (bytes1 > count) {
   251			bytes1 = count;
   252			bytes2 = 0;
   253		} else if ((bytes1 + bytes2) > count) {
   254			bytes2 = count - bytes1;
   255		}
   256	
   257		rc = -EFAULT;
   258		smp_rmb(); /* Ensure that we see the port before we copy it. */
 > 259		if (!copy_to_iter_full(evtchn_ring_entry(u, c), bytes1, to) ||
   260		    ((bytes2 != 0) &&
   261		     !copy_to_iter_full(&u->ring[0], bytes2, to)))
   262			goto unlock_out;
   263	
   264		WRITE_ONCE(u->ring_cons, c + (bytes1 + bytes2) / sizeof(evtchn_port_t));
   265		rc = bytes1 + bytes2;
   266	
   267	 unlock_out:
   268		mutex_unlock(&u->ring_cons_mutex);
   269		return rc;
   270	}
   271	
   272	static ssize_t evtchn_write(struct kiocb *iocb, struct iov_iter *from)
   273	{
   274		int rc, i;
   275		evtchn_port_t *kbuf = (evtchn_port_t *)__get_free_page(GFP_KERNEL);
   276		struct per_user_data *u = iocb->ki_filp->private_data;
   277		size_t count = iov_iter_count(from);
   278	
   279		if (kbuf == NULL)
   280			return -ENOMEM;
   281	
   282		/* Whole number of ports. */
   283		count &= ~(sizeof(evtchn_port_t)-1);
   284	
   285		rc = 0;
   286		if (count == 0)
   287			goto out;
   288	
   289		if (count > PAGE_SIZE)
   290			count = PAGE_SIZE;
   291	
   292		rc = -EFAULT;
 > 293		if (!copy_from_iter_full(kbuf, count, from) != 0)
   294			goto out;
   295	
   296		mutex_lock(&u->bind_mutex);
   297	
   298		for (i = 0; i < (count/sizeof(evtchn_port_t)); i++) {
   299			evtchn_port_t port = kbuf[i];
   300			struct user_evtchn *evtchn;
   301	
   302			evtchn = find_evtchn(u, port);
   303			if (evtchn && !evtchn->enabled) {
   304				evtchn->enabled = true;
   305				xen_irq_lateeoi(irq_from_evtchn(port), 0);
   306			}
   307		}
   308	
   309		mutex_unlock(&u->bind_mutex);
   310	
   311		rc = count;
   312	
   313	 out:
   314		free_page((unsigned long)kbuf);
   315		return rc;
   316	}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
