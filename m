Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB212D76B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712259851; cv=none; b=MDEuEw5P0LEOGI4Ek5yWKXnhsoDpmw04CVbzwBsWsR5n5HOGT7Qbj4T/GBiVUeAVzdesyLqtXVpDDokqCq6FHsrb/GrPJMYOxtZu5Si4SzSiWc23c0ZMfHCVtrPOQ5mnAquzgZunYu9VPkjm3paJ+wN3PQ7QEFkPfyct+JW0e3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712259851; c=relaxed/simple;
	bh=uoWNICjpf4U7kk/GFbCia5qYPnp6gTvfxoAFerYVhsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUXQJWpXwq6o/ncy8sEUVVkY6r0TBbHCZbDUMrpkEhahJv6AeaVMR7Sl5nGitS0w9PezASBNjd7rmxW27hFVnd17kiQRoNzV1oxazarYZdAS7D8QaQaroVNIKZJkBFAADU4j3sqJoRfzOk5repQZExfeMpJKCZtOLSHAeO0bsSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWsHYf1L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWsHYf1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712259849; x=1743795849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoWNICjpf4U7kk/GFbCia5qYPnp6gTvfxoAFerYVhsU=;
  b=eWsHYf1LxdCM61N9CR0MpVPA7djatnYFqtSzMo/2y4rmqpZJ+szdY+mH
   SkO0/yHtQfoGgJKZUa7g9KcAHT7XeI65AJA+qk6Wn19HuK9rcLZ3g0ubA
   m1raLj4GyJAT4W6YAU4JbMS3ZMNit95AvuVojagtaIqGaJC0xjmh7JdJF
   pUXp9dQH6c5A4OZF0E+pljf10XCr7/9XURTkiAlVzvig9agnCll7Gus4y
   8F4zoEW2LvYxHkR8LjQ/prFFyH8JH+xu2/suXAB+dofbNv3LtyIUfZ4Rs
   pouZMY3aTTOaoSjFYZL5oDHOXYNuhdLV6g6BSl2+Ud4n3XMGllwmlgDBU
   g==;
X-CSE-ConnectionGUID: A3LhWWhuTASDr5ZjHtd9Aw==
X-CSE-MsgGUID: T4B0ggowQoKXX0AuuacWaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7806176"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7806176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:44:09 -0700
X-CSE-ConnectionGUID: eZjKUnQrTVOdZD5XXkjUbw==
X-CSE-MsgGUID: MwaPp4HnTgirkJH+S70quw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19346898"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2024 12:44:07 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsT0G-0001R0-2b;
	Thu, 04 Apr 2024 19:44:04 +0000
Date: Fri, 5 Apr 2024 03:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20821/22045] fs/io_uring.c:3882:14:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202404050320.ikGdTX4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e89315eb08769716cbf7e08f49672222cf0eca47
commit: b2b243d6115480833f9d888b06d70e372ae6fdb2 [20821/22045] io_uring: get rid of intermediate IORING_OP_CLOSE stage
config: arm64-randconfig-r112-20240401 (https://download.01.org/0day-ci/archive/20240405/202404050320.ikGdTX4Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404050320.ikGdTX4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050320.ikGdTX4Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/io_uring.c:2822:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] <asn:1> * @@     got struct io_buffer *[assigned] kbuf @@
   fs/io_uring.c:2822:24: sparse:     expected void [noderef] <asn:1> *
   fs/io_uring.c:2822:24: sparse:     got struct io_buffer *[assigned] kbuf
   fs/io_uring.c:2988:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:1> *[assigned] iov_base @@     got void * @@
   fs/io_uring.c:2988:40: sparse:     expected void [noderef] <asn:1> *[assigned] iov_base
   fs/io_uring.c:2988:40: sparse:     got void *
   fs/io_uring.c:3364:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected long long [noderef] [usertype] <asn:1> *off_in @@     got long long [usertype] *[assigned] poff_in @@
   fs/io_uring.c:3364:37: sparse:     expected long long [noderef] [usertype] <asn:1> *off_in
   fs/io_uring.c:3364:37: sparse:     got long long [usertype] *[assigned] poff_in
   fs/io_uring.c:3364:51: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected long long [noderef] [usertype] <asn:1> *off_out @@     got long long [usertype] *[assigned] poff_out @@
   fs/io_uring.c:3364:51: sparse:     expected long long [noderef] [usertype] <asn:1> *off_out
   fs/io_uring.c:3364:51: sparse:     got long long [usertype] *[assigned] poff_out
>> fs/io_uring.c:3882:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] file @@     got struct file [noderef] <asn:4> * @@
   fs/io_uring.c:3882:14: sparse:     expected struct file *[assigned] file
   fs/io_uring.c:3882:14: sparse:     got struct file [noderef] <asn:4> *
   fs/io_uring.c:4529:72: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   fs/io_uring.c:4529:72: sparse:     expected int mask
   fs/io_uring.c:4529:72: sparse:     got restricted __poll_t [usertype] mask
   fs/io_uring.c:4533:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] result @@     got restricted __poll_t [usertype] mask @@
   fs/io_uring.c:4533:21: sparse:     expected unsigned int [usertype] result
   fs/io_uring.c:4533:21: sparse:     got restricted __poll_t [usertype] mask
   fs/io_uring.c:4571:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] result @@     got restricted __poll_t @@
   fs/io_uring.c:4571:29: sparse:     expected unsigned int [usertype] result
   fs/io_uring.c:4571:29: sparse:     got restricted __poll_t
   fs/io_uring.c:4636:34: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned int [usertype] result @@
   fs/io_uring.c:4636:34: sparse:     expected restricted __poll_t [usertype] mask
   fs/io_uring.c:4636:34: sparse:     got unsigned int [usertype] result
   fs/io_uring.c:4788:41: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] @@
   fs/io_uring.c:4788:41: sparse:     expected int mask
   fs/io_uring.c:4788:41: sparse:     got restricted __poll_t [usertype]
   fs/io_uring.c:4877:22: sparse: sparse: invalid assignment: |=
   fs/io_uring.c:4877:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4877:22: sparse:    right side has type int
   fs/io_uring.c:4879:22: sparse: sparse: invalid assignment: |=
   fs/io_uring.c:4879:22: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4879:22: sparse:    right side has type int
   fs/io_uring.c:4880:14: sparse: sparse: invalid assignment: |=
   fs/io_uring.c:4880:14: sparse:    left side has type restricted __poll_t
   fs/io_uring.c:4880:14: sparse:    right side has type int
   fs/io_uring.c:4894:67: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   fs/io_uring.c:4894:67: sparse:     expected int mask
   fs/io_uring.c:4894:67: sparse:     got restricted __poll_t [assigned] [usertype] mask
   fs/io_uring.c:4895:52: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   fs/io_uring.c:4895:52: sparse:     expected int events
   fs/io_uring.c:4895:52: sparse:     got restricted __poll_t [usertype] events
   fs/io_uring.c:5051:34: sparse: sparse: restricted __poll_t degrades to integer
   fs/io_uring.c:5050:57: sparse: sparse: restricted __poll_t degrades to integer
   fs/io_uring.c:5050:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got unsigned int @@
   fs/io_uring.c:5050:22: sparse:     expected restricted __poll_t [usertype] events
   fs/io_uring.c:5050:22: sparse:     got unsigned int
   In file included from include/linux/hugetlb.h:45,
                    from fs/io_uring.c:73:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   fs/io_uring.c: In function 'io_probe.isra':
   fs/io_uring.c:8725:23: warning: array subscript i is outside array bounds of 'struct io_uring_probe_op[0]' [-Warray-bounds=]
    8725 |                 p->ops[i].op = i;
         |                 ~~~~~~^~~
   In file included from fs/io_uring.c:86:
   include/uapi/linux/io_uring.h:291:34: note: while referencing 'ops'
     291 |         struct io_uring_probe_op ops[0];
         |                                  ^~~
   fs/io_uring.c:8727:31: warning: array subscript i is outside array bounds of 'struct io_uring_probe_op[0]' [-Warray-bounds=]
    8727 |                         p->ops[i].flags = IO_URING_OP_SUPPORTED;
         |                         ~~~~~~^~~
   include/uapi/linux/io_uring.h:291:34: note: while referencing 'ops'
     291 |         struct io_uring_probe_op ops[0];
         |                                  ^~~
   In file included from include/linux/if_ether.h:23,
                    from include/uapi/linux/ethtool.h:19,
                    from include/linux/ethtool.h:19,
                    from include/linux/netdevice.h:42,
                    from include/net/sock.h:52,
                    from fs/io_uring.c:65:
   In function '__skb_queue_before',
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1908:2,
       inlined from 'io_ring_file_put.isra' at fs/io_uring.c:6991:3:
   include/linux/skbuff.h:1874:9: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1874 |         __skb_insert(newsk, next->prev, next, list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c: In function 'io_ring_file_put.isra':
   fs/io_uring.c:6949:29: note: object 'list' of size 80
    6949 |         struct sk_buff_head list, *head = &sock->sk_receive_queue;
         |                             ^~~~
   In function '__skb_queue_before',
       inlined from '__skb_queue_tail' at include/linux/skbuff.h:1908:2,
       inlined from 'io_ring_file_put.isra' at fs/io_uring.c:6981:5:
   include/linux/skbuff.h:1874:9: warning: array subscript 'struct sk_buff[0]' is partly outside array bounds of 'struct sk_buff_head[1]' [-Warray-bounds=]
    1874 |         __skb_insert(newsk, next->prev, next, list);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c: In function 'io_ring_file_put.isra':
   fs/io_uring.c:6949:29: note: object 'list' of size 80
    6949 |         struct sk_buff_head list, *head = &sock->sk_receive_queue;
         |                             ^~~~
   In file included from include/linux/poll.h:12,
                    from include/linux/ring_buffer.h:7,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:86,
                    from fs/io_uring.c:45:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'io_uring_setup' at fs/io_uring.c:8679:6:
   include/linux/uaccess.h:112:17: warning: 'p' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:265,
                    from include/linux/kernel.h:10,
                    from fs/io_uring.c:42:
   include/linux/kasan-checks.h: In function 'io_uring_setup':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);

vim +3882 fs/io_uring.c

  3864	
  3865	static int io_close(struct io_kiocb *req, bool force_nonblock,
  3866			    struct io_comp_state *cs)
  3867	{
  3868		struct files_struct *files = current->files;
  3869		struct io_close *close = &req->close;
  3870		struct fdtable *fdt;
  3871		struct file *file;
  3872		int ret;
  3873	
  3874		file = NULL;
  3875		ret = -EBADF;
  3876		spin_lock(&files->file_lock);
  3877		fdt = files_fdtable(files);
  3878		if (close->fd >= fdt->max_fds) {
  3879			spin_unlock(&files->file_lock);
  3880			goto err;
  3881		}
> 3882		file = fdt->fd[close->fd];
  3883		if (!file) {
  3884			spin_unlock(&files->file_lock);
  3885			goto err;
  3886		}
  3887	
  3888		if (file->f_op == &io_uring_fops) {
  3889			spin_unlock(&files->file_lock);
  3890			file = NULL;
  3891			goto err;
  3892		}
  3893	
  3894		/* if the file has a flush method, be safe and punt to async */
  3895		if ((file->f_op->flush && force_nonblock) ||
  3896		    req->close.fd == req->ctx->ring_fd) {
  3897			spin_unlock(&files->file_lock);
  3898			return -EAGAIN;
  3899		}
  3900	
  3901		ret = __close_fd_get_file(close->fd, &file);
  3902		spin_unlock(&files->file_lock);
  3903		if (ret < 0) {
  3904			if (ret == -ENOENT)
  3905				ret = -EBADF;
  3906			goto err;
  3907		}
  3908	
  3909		/* No ->flush() or already async, safely close from here */
  3910		ret = filp_close(file, current->files);
  3911	err:
  3912		if (ret < 0)
  3913			req_set_fail_links(req);
  3914		if (file)
  3915			fput(file);
  3916		__io_req_complete(req, ret, 0, cs);
  3917		return 0;
  3918	}
  3919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
