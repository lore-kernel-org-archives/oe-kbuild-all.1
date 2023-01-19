Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042AE15A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 01:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674091051; x=1705627051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5YioTq1mi0FQzL5L6+ik6gE1Fz9rrGR1YKFWv3B5uk=;
  b=MROKNjttWAzNZMq0hrrjX+wPfnigI/Rh2XDlymMBxtnFAhhmJT6/c0/H
   FkqGzJd5rXG+7Q5YD2IwGcwelhO3cTepQFAIvCMQ3qbzrOBONI9j6EtVJ
   zcI3nQ6mRr7G3VWyNkluhSgpypzMiSiY9CmQ7mPI5TSNbGKuAiCZZN63x
   lYfA2ajMdgOxfRC+WkToA6K6TxK0TJuO6jLeb4zCg8edhOGtzE2stbyEj
   WlaVp6zW+Lrczc/UBINwOIu1sQ8HmQ4qSpTp1FucgnqBfH/zaK/Mz0mLm
   bknj9asM9dXd6mMUxh/Y8EWvmPuzm30cElxsF+Q24kO2hB7EZotS46BM7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323842334"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323842334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 17:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723314432"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="723314432"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 17:17:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJYS-0000vw-12;
	Thu, 19 Jan 2023 01:17:24 +0000
Date: Thu, 19 Jan 2023 09:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	krisman@collabora.com, tglx@linutronix.de, luto@kernel.org,
	oleg@redhat.com, peterz@infradead.org, ebiederm@xmission.com,
	akpm@linux-foundation.org, adobriyan@gmail.com, corbet@lwn.net,
	shuah@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH 3/3] ptrace,syscall_user_dispatch: add a getter/setter
 for sud configuration
Message-ID: <202301190907.YBfaBhHB-lkp@intel.com>
References: <20230118201055.147228-4-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118201055.147228-4-gregory.price@memverge.com>

Hi Gregory,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2-rc4 next-20230118]
[cannot apply to tip/core/entry]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/ptrace-syscall_user_dispatch-Implement-Syscall-User-Dispatch-Suspension/20230119-041259
patch link:    https://lore.kernel.org/r/20230118201055.147228-4-gregory.price%40memverge.com
patch subject: [PATCH 3/3] ptrace,syscall_user_dispatch: add a getter/setter for sud configuration
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230119/202301190907.YBfaBhHB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bd6833b41ed48c444c09346f695efe229deec2e9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gregory-Price/ptrace-syscall_user_dispatch-Implement-Syscall-User-Dispatch-Suspension/20230119-041259
        git checkout bd6833b41ed48c444c09346f695efe229deec2e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: fs/isofs/inode.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/inode.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/dir.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/dir.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/util.o: in function `syscall_user_dispatch_get_config':
   fs/isofs/util.c:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/util.o: in function `syscall_user_dispatch_set_config':
   fs/isofs/util.c:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/rock.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/rock.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/export.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/export.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/joliet.o: in function `syscall_user_dispatch_get_config':
   fs/isofs/joliet.c:49: multiple definition of `syscall_user_dispatch_get_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/isofs/joliet.o: in function `syscall_user_dispatch_set_config':
   fs/isofs/joliet.c:49: multiple definition of `syscall_user_dispatch_set_config'; fs/isofs/namei.o:include/linux/syscall_user_dispatch.h:49: first defined here
--
   ld: fs/autofs/inode.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/inode.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/root.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/root.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/symlink.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/symlink.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/waitq.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/waitq.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/expire.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/expire.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/dev-ioctl.o: in function `syscall_user_dispatch_get_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_get_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here
   ld: fs/autofs/dev-ioctl.o: in function `syscall_user_dispatch_set_config':
>> include/linux/syscall_user_dispatch.h:49: multiple definition of `syscall_user_dispatch_set_config'; fs/autofs/init.o:include/linux/syscall_user_dispatch.h:49: first defined here


vim +49 include/linux/syscall_user_dispatch.h

    44	
    45	int syscall_user_dispatch_get_config(struct task_struct *task, unsigned long size,
    46		void __user *data)
    47	{
    48		return -EINVAL;
  > 49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
