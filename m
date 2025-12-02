Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305022773F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764638926; cv=none; b=XBrJxe5vkNVcOJqwmEIwR4gdQ2OuTzT11U7XqgKoskwmD9BCanPGUxTehz/Ft743ovOdjaJNfjCeYKz5hJx6nACd734ZDOH/jPyly5MnXzUxQWPeQE0AjeiVsy9/aJAps8OlRxqNmWFsAKVak3aCjmAc3d/LfjTBWR5LXfikx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764638926; c=relaxed/simple;
	bh=58rVf3e491bX5GXEp9DrDp/3iiOCL2wiMSVDEwhctxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQT94VQFhjgDbJje7LpLKUS7sIU/ebiEfYed3t7dbbflwdFlRIJMFf/f9dtnD87hSvfjY3Y4fgVKiSRkeEP6hNNQNgg1Xxaa7WSYOxsv35qQvV/ZtNtBgb7L1JziAG75l8kUnjE2yNZ2s7pe8hRAZisBa2WbtSq/dsCPtC34Eoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCnujjS3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCnujjS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764638924; x=1796174924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=58rVf3e491bX5GXEp9DrDp/3iiOCL2wiMSVDEwhctxY=;
  b=jCnujjS3Py3POnsKZq+MZ+urd5Wlp5+o0zxrztNZ4aasYo/rLNdlDIyW
   AjvdeHKp6oPtdYhtF+/TLVEG81kCP8/sshkCRqScpOnqsqANwNq0wisw0
   xh+Ytmkgrfr7pTi/o5sfD2f+7YliVBfyHqw2+TdwQESrJKbHDzuBU61Br
   yT9BtT8tbvviEO5n7NKPEHWuf8GpOTqfjynw38ldu0tcAoRHpkh5RiBpF
   sFRWK03v+T9oVhK3wkO9dDEQ1NL8g2XbTqTOEuelbPfH+6D0oCuNxl5iJ
   5bKiWDv3i24i22zAKsAc5wFvHsL77E18dl84013MLQXfxGezI8qaX/3tK
   w==;
X-CSE-ConnectionGUID: kmq6HdXlSKqY/yxA7wxgUQ==
X-CSE-MsgGUID: MQLqOB7+RkKAcTIkUjko+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66629337"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66629337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:26:50 -0800
X-CSE-ConnectionGUID: KykeK/c9RwefmHNb1dFFzQ==
X-CSE-MsgGUID: 0ahyf3QWRaGgcKxJ52PFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194064427"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 17:26:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFAE-000000009I1-1MCx;
	Tue, 02 Dec 2025 01:26:46 +0000
Date: Tue, 2 Dec 2025 09:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 36/36] fs/file.c:423:16: error:
 incompatible pointer types passing 'struct task_dma_buf_info *' to parameter
 of type 'struct task_struct *'
Message-ID: <202512020939.s662g5Ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: 5dd8a05ba11a36d91c244d3e482a18a275e5d8ad [36/36] ANDROID: Don't use current pointer for per-process dmabuf accounting
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251202/202512020939.s662g5Ig-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020939.s662g5Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020939.s662g5Ig-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/exec.c:67:
>> include/linux/dma-buf.h:824:5: warning: no previous prototype for function 'dma_buf_begin_new_exec' [-Wmissing-prototypes]
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         |     ^
   include/linux/dma-buf.h:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         | ^
         | static 
   1 warning generated.
--
   In file included from fs/file.c:23:
>> include/linux/dma-buf.h:824:5: warning: no previous prototype for function 'dma_buf_begin_new_exec' [-Wmissing-prototypes]
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         |     ^
   include/linux/dma-buf.h:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         | ^
         | static 
>> fs/file.c:423:16: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     423 |                                                                        files->dmabuf_info);
         |                                                                        ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:820:28: note: passing argument to parameter 'task' here
     820 |                                           struct task_struct *task) {}
         |                                                               ^
   fs/file.c:444:19: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     444 |                 put_dmabuf_info(files->dmabuf_info);
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   fs/file.c:601:54: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     601 |                 int err = dma_buf_account_task(file->private_data, files->dmabuf_info);
         |                                                                    ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:818:32: note: passing argument to parameter 'task' here
     818 |                                        struct task_struct *task) { return 0; }
         |                                                            ^
   fs/file.c:650:47: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     650 |                         dma_buf_unaccount_task(file->private_data, files->dmabuf_info);
         |                                                                    ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:820:28: note: passing argument to parameter 'task' here
     820 |                                           struct task_struct *task) {}
         |                                                               ^
   fs/file.c:765:19: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     765 |                 put_dmabuf_info(current->dmabuf_info);
         |                                 ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/current.h:18:17: note: expanded from macro 'current'
      18 | #define current get_current()
         |                 ^
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   fs/file.c:846:48: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     846 |                                 dma_buf_unaccount_task(file->private_data, files->dmabuf_info);
         |                                                                            ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:820:28: note: passing argument to parameter 'task' here
     820 |                                           struct task_struct *task) {}
         |                                                               ^
   fs/file.c:1142:49: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    1142 |                         dma_buf_unaccount_task(tofree->private_data, files->dmabuf_info);
         |                                                                      ^~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:820:28: note: passing argument to parameter 'task' here
     820 |                                           struct task_struct *task) {}
         |                                                               ^
   1 warning and 7 errors generated.
--
   In file included from kernel/fork.c:102:
>> include/linux/dma-buf.h:824:5: warning: no previous prototype for function 'dma_buf_begin_new_exec' [-Wmissing-prototypes]
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         |     ^
   include/linux/dma-buf.h:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         | ^
         | static 
>> kernel/fork.c:935:18: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     935 |         put_dmabuf_info(tsk->dmabuf_info);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   kernel/fork.c:1303:18: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    1303 |         put_dmabuf_info(mm->dmabuf_info);
         |                         ^~~~~~~~~~~~~~~
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   kernel/fork.c:2709:18: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    2709 |         put_dmabuf_info(p->dmabuf_info);
         |                         ^~~~~~~~~~~~~~
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   kernel/fork.c:3503:18: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    3503 |         put_dmabuf_info(task->dmabuf_info);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:823:56: note: passing argument to parameter 'task' here
     823 | static inline void put_dmabuf_info(struct task_struct *task) {}
         |                                                        ^
   1 warning and 4 errors generated.
--
   In file included from mm/mmap.c:51:
>> include/linux/dma-buf.h:824:5: warning: no previous prototype for function 'dma_buf_begin_new_exec' [-Wmissing-prototypes]
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         |     ^
   include/linux/dma-buf.h:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         | ^
         | static 
>> mm/mmap.c:149:13: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
     149 |                                                vma->vm_mm->dmabuf_info);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:820:28: note: passing argument to parameter 'task' here
     820 |                                           struct task_struct *task) {}
         |                                                               ^
   mm/mmap.c:2463:12: error: incompatible pointer types passing 'struct task_dma_buf_info *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    2463 |                                                             new->vm_mm->dmabuf_info);
         |                                                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:818:32: note: passing argument to parameter 'task' here
     818 |                                        struct task_struct *task) { return 0; }
         |                                                            ^
   1 warning and 2 errors generated.
--
   In file included from mm/slub.c:45:
   In file included from include/trace/events/kmem.h:11:
>> include/linux/dma-buf.h:824:5: warning: no previous prototype for function 'dma_buf_begin_new_exec' [-Wmissing-prototypes]
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         |     ^
   include/linux/dma-buf.h:824:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     824 | int dma_buf_begin_new_exec(struct files_struct *old_files) { return 0; }
         | ^
         | static 
   mm/slub.c:2227:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2227 |         unsigned int partial_slabs = 0;
         |                      ^
   mm/slub.c:859:28: warning: unused function 'get_orig_size' [-Wunused-function]
     859 | static inline unsigned int get_orig_size(struct kmem_cache *s, void *object)
         |                            ^~~~~~~~~~~~~
   3 warnings generated.


vim +423 fs/file.c

   400	
   401	static struct fdtable *close_files(struct files_struct * files)
   402	{
   403		/*
   404		 * It is safe to dereference the fd table without RCU or
   405		 * ->file_lock because this is the last reference to the
   406		 * files structure.
   407		 */
   408		struct fdtable *fdt = rcu_dereference_raw(files->fdt);
   409		unsigned int i, j = 0;
   410	
   411		for (;;) {
   412			unsigned long set;
   413			i = j * BITS_PER_LONG;
   414			if (i >= fdt->max_fds)
   415				break;
   416			set = fdt->open_fds[j++];
   417			while (set) {
   418				if (set & 1) {
   419					struct file * file = xchg(&fdt->fd[i], NULL);
   420					if (file) {
   421						if (is_dma_buf_file(file))
   422							dma_buf_unaccount_task(file->private_data,
 > 423									       files->dmabuf_info);
   424						filp_close(file, files);
   425						cond_resched();
   426					}
   427				}
   428				i++;
   429				set >>= 1;
   430			}
   431		}
   432	
   433		return fdt;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
