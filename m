Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384951173D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pty67IK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696893505; x=1728429505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxuWgAq2AkUjFQTVKiCE9Z8FHUiUI+0Zlp6Qg8psI14=;
  b=Pty67IK+qYYFHWbXR2iR4iubtI6/bHIILeio9SC7IlqtBTtv0ujS+uVn
   agohhn3WILWVABkciF8JCuL02yqE+8IwKMt4yU53katg793pI0wKkfxa0
   V4CXqWdXGe+Yns/XvsHV5a4uM8iUYVhmUdo8NbEnxWukhB4fHp7m+WR9d
   SfLxL6kUlIdYt5lHV8HKvg56TsB6V9cXIkNBINWhxwiHqg0vRTJVjbAII
   CNjHf7zGDYvd+tDO0tgzaLRoJIpYqEksGGEffwxQ5vgpSQjKoTVd2pRGS
   vThHAyrfGRi90KjzRzMp+hbqdTfI9ztRHim4l/KS1fnUch0BoiWJyYOSr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470530086"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="470530086"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 16:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000419938"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="1000419938"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2023 16:18:23 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpzW0-0000o8-1l;
	Mon, 09 Oct 2023 23:18:20 +0000
Date: Tue, 10 Oct 2023 07:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 159/30000]
 drivers/misc/uid_sys_stats.c:610:37: warning: 'uid_procstat_fops' defined
 but not used
Message-ID: <202310100746.J2gwk2uC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   5759bbcc0d24a0f84f9021cf06f02a08c4e739fe
commit: f4eeb5d6c6ab87a5ac3b571354560a2219944932 [159/30000] ANDROID: uid_cputime: add per-uid IO usage accounting
config: arm64-randconfig-002-20231010 (https://download.01.org/0day-ci/archive/20231010/202310100746.J2gwk2uC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100746.J2gwk2uC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100746.J2gwk2uC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/uid_sys_stats.c:610:37: warning: 'uid_procstat_fops' defined but not used [-Wunused-const-variable=]
     610 | static const struct file_operations uid_procstat_fops = {
         |                                     ^~~~~~~~~~~~~~~~~
>> drivers/misc/uid_sys_stats.c:553:37: warning: 'uid_io_fops' defined but not used [-Wunused-const-variable=]
     553 | static const struct file_operations uid_io_fops = {
         |                                     ^~~~~~~~~~~
   drivers/misc/uid_sys_stats.c:439:37: warning: 'uid_remove_fops' defined but not used [-Wunused-const-variable=]
     439 | static const struct file_operations uid_remove_fops = {
         |                                     ^~~~~~~~~~~~~~~
>> drivers/misc/uid_sys_stats.c:383:37: warning: 'uid_cputime_fops' defined but not used [-Wunused-const-variable=]
     383 | static const struct file_operations uid_cputime_fops = {
         |                                     ^~~~~~~~~~~~~~~~


vim +/uid_procstat_fops +610 drivers/misc/uid_sys_stats.c

   552	
 > 553	static const struct file_operations uid_io_fops = {
   554		.open		= uid_io_open,
   555		.read		= seq_read,
   556		.llseek		= seq_lseek,
   557		.release	= single_release,
   558	};
   559	
   560	static int uid_procstat_open(struct inode *inode, struct file *file)
   561	{
   562		return single_open(file, NULL, NULL);
   563	}
   564	
   565	static ssize_t uid_procstat_write(struct file *file,
   566				const char __user *buffer, size_t count, loff_t *ppos)
   567	{
   568		struct uid_entry *uid_entry;
   569		uid_t uid;
   570		int argc, state;
   571		char input[128];
   572	
   573		if (count >= sizeof(input))
   574			return -EINVAL;
   575	
   576		if (copy_from_user(input, buffer, count))
   577			return -EFAULT;
   578	
   579		input[count] = '\0';
   580	
   581		argc = sscanf(input, "%u %d", &uid, &state);
   582		if (argc != 2)
   583			return -EINVAL;
   584	
   585		if (state != UID_STATE_BACKGROUND && state != UID_STATE_FOREGROUND)
   586			return -EINVAL;
   587	
   588		rt_mutex_lock(&uid_lock);
   589	
   590		uid_entry = find_or_register_uid(uid);
   591		if (!uid_entry) {
   592			rt_mutex_unlock(&uid_lock);
   593			return -EINVAL;
   594		}
   595	
   596		if (uid_entry->state == state) {
   597			rt_mutex_unlock(&uid_lock);
   598			return count;
   599		}
   600	
   601		update_io_stats_uid_locked(uid_entry);
   602	
   603		uid_entry->state = state;
   604	
   605		rt_mutex_unlock(&uid_lock);
   606	
   607		return count;
   608	}
   609	
 > 610	static const struct file_operations uid_procstat_fops = {
   611		.open		= uid_procstat_open,
   612		.release	= single_release,
   613		.write		= uid_procstat_write,
   614	};
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
