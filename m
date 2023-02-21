Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245704C64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676993238; x=1708529238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPx/uLGZByyC2kGwi8uUp15WidM7zRNHBuiYMBDShq4=;
  b=b1Jh1MqM7GI41phqwXkz5PKh6pdJerUbqA++eKPUOAgutzahbZd/j7Ut
   x4h/dHWJ7PH+meRDmBY99u21kKYxHg8fwVS15jJvfFhccV7ybZYew2LC5
   ZHlPSLYCdpPLbrnUhPNLUdEDHeYPQwEJLCDg0mIqOzR5lmryUks4ilYe9
   elIOjAhyC3c3foB7V0NTtOM+yVNXWaS4hUIwSyb3hOtaQ0eQAqyDPlyUU
   1LW4ZGzkxMII2o1QLb9jRpKasjT+FWeXg4yRyWJmx4+llXUXEFuftnKd1
   6QXE9DLEMLX0G1Qdzc6QVOM8VypwEhOK6+ZRkuOMh4RIq19PF2Wq7WMd9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397347491"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397347491"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000648793"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000648793"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 07:27:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUUXz-000EtA-2e;
	Tue, 21 Feb 2023 15:27:15 +0000
Date: Tue, 21 Feb 2023 23:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-01 1/1]
 drivers/android/binder.c:2497:28: warning: cast to pointer from integer of
 different size
Message-ID: <202302212338.Q916cOCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-01
head:   89d2b2bbcecc0f45892db1092041dc6124d26229
commit: 89d2b2bbcecc0f45892db1092041dc6124d26229 [1/1] UPSTREAM: binder: read pre-translated fds from sender buffer
config: i386-randconfig-a002-20230220 (https://download.01.org/0day-ci/archive/20230221/202302212338.Q916cOCq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2023-01
        git checkout 89d2b2bbcecc0f45892db1092041dc6124d26229
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302212338.Q916cOCq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c: In function 'binder_translate_fd_array':
>> drivers/android/binder.c:2497:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2497 |         sender_ufda_base = (void __user *)sender_uparent->buffer + fda->parent_offset;
         |                            ^


vim +2497 drivers/android/binder.c

  2461	
  2462	static int binder_translate_fd_array(struct binder_fd_array_object *fda,
  2463					     const void __user *sender_ubuffer,
  2464					     struct binder_buffer_object *parent,
  2465					     struct binder_buffer_object *sender_uparent,
  2466					     struct binder_transaction *t,
  2467					     struct binder_thread *thread,
  2468					     struct binder_transaction *in_reply_to)
  2469	{
  2470		binder_size_t fdi, fd_buf_size;
  2471		binder_size_t fda_offset;
  2472		const void __user *sender_ufda_base;
  2473		struct binder_proc *proc = thread->proc;
  2474	
  2475		fd_buf_size = sizeof(u32) * fda->num_fds;
  2476		if (fda->num_fds >= SIZE_MAX / sizeof(u32)) {
  2477			binder_user_error("%d:%d got transaction with invalid number of fds (%lld)\n",
  2478					  proc->pid, thread->pid, (u64)fda->num_fds);
  2479			return -EINVAL;
  2480		}
  2481		if (fd_buf_size > parent->length ||
  2482		    fda->parent_offset > parent->length - fd_buf_size) {
  2483			/* No space for all file descriptors here. */
  2484			binder_user_error("%d:%d not enough space to store %lld fds in buffer\n",
  2485					  proc->pid, thread->pid, (u64)fda->num_fds);
  2486			return -EINVAL;
  2487		}
  2488		/*
  2489		 * the source data for binder_buffer_object is visible
  2490		 * to user-space and the @buffer element is the user
  2491		 * pointer to the buffer_object containing the fd_array.
  2492		 * Convert the address to an offset relative to
  2493		 * the base of the transaction buffer.
  2494		 */
  2495		fda_offset = (parent->buffer - (uintptr_t)t->buffer->user_data) +
  2496			fda->parent_offset;
> 2497		sender_ufda_base = (void __user *)sender_uparent->buffer + fda->parent_offset;
  2498	
  2499		if (!IS_ALIGNED((unsigned long)fda_offset, sizeof(u32)) ||
  2500		    !IS_ALIGNED((unsigned long)sender_ufda_base, sizeof(u32))) {
  2501			binder_user_error("%d:%d parent offset not aligned correctly.\n",
  2502					  proc->pid, thread->pid);
  2503			return -EINVAL;
  2504		}
  2505		for (fdi = 0; fdi < fda->num_fds; fdi++) {
  2506			u32 fd;
  2507			int ret;
  2508			binder_size_t offset = fda_offset + fdi * sizeof(fd);
  2509			binder_size_t sender_uoffset = fdi * sizeof(fd);
  2510	
  2511			ret = copy_from_user(&fd, sender_ufda_base + sender_uoffset, sizeof(fd));
  2512			if (!ret)
  2513				ret = binder_translate_fd(fd, offset, t, thread,
  2514							  in_reply_to);
  2515			if (ret)
  2516				return ret > 0 ? -EINVAL : ret;
  2517		}
  2518		return 0;
  2519	}
  2520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
