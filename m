Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD4F15539A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581679; cv=none; b=XhxaOBq/bE3P0lR4HVODDh+O6x1ZX/Mq1yO+dnU6owXSzQAvfL/J8ZHVPBRcDje/xpWetuxj4vZYJ6KX/A/a+j4JuSippK3SKkMvpuxnr8IgdMSFPlQtrShe38IHvUTchAn/e56pqCceaUbvXEr09qJ8fj2z1lI9jtZ0co9egzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581679; c=relaxed/simple;
	bh=HlOlRsY8VkuPhk42iHffCS4qSyjE2ec0oAIYodC8ygc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJOu4bC0KcRrVUUhdjK49+XeqJ1wWUIuinc5v7Vfc+xWZ2L8WAztMW1aWlv6ApXpPCquV/wuc78ry2YCRNenqE9ui3kBGUHZLXlU8pxATo0ixeeykxnj3ZkoJ3H57fcG6Ahj1J2NwM4JeW8K7yRCZg5j17g8ZNytTi7v4tbgmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF648E83; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF648E83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730581678; x=1762117678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlOlRsY8VkuPhk42iHffCS4qSyjE2ec0oAIYodC8ygc=;
  b=MF648E835/i37rusm8ibOXC3AQW3GtyxBu17aORNCsM0q3cByWuOKIAY
   mCdD/Gpbs9X9LREbIzkczRXi9IpCVjkrsLIkHq1Gh62hJm9cfBs4L9WAY
   rnNseWd0+LI4wFupR35T19py87k5Q/frswXN7tW4G6SE8VndssuJeWe3L
   Lti/9Trzgw7DlV5eSFPmZqJBtO5Go40DQQ3/4U+CZXRAVaq+goWAi6V+4
   LSQeD6w17fEcafvLnnY1pbhS67A9k2jppKDXUCWStOJjdnW5UogFesoYm
   ZNJUdaso1f8PxEcXJET2p0LGTHv959L/9yHbet50JuI9/xuOp1r0Iuc7o
   g==;
X-CSE-ConnectionGUID: HkbU/5gwSkKMrB8HAoEodg==
X-CSE-MsgGUID: /Onp7s3ITmyOF7o00+AMyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30164805"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30164805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 14:07:55 -0700
X-CSE-ConnectionGUID: irppZLJ5RQOiR+fTmGfr1w==
X-CSE-MsgGUID: 9QnhHtQJQniqelKuJS5Agg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88033151"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2024 14:07:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7LLb-000jLd-25;
	Sat, 02 Nov 2024 21:07:51 +0000
Date: Sun, 3 Nov 2024 05:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-simple 14/14]
 kernel/module/sysfs.c:199:37: error: assignment to 'ssize_t (*)(struct file
 *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka
 'long int (*)(struct file *, struct kobject *, struct bin_attribute *, char
 *, long long int,  long uns...
Message-ID: <202411030454.5khfl5qQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-simple
head:   621fe990596bff092203435a832fd67c3aefb87a
commit: 621fe990596bff092203435a832fd67c3aefb87a [14/14] sysfs_bin_attr_simple_read
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411030454.5khfl5qQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030454.5khfl5qQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030454.5khfl5qQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/sysfs.c: In function 'add_notes_attrs':
>> kernel/module/sysfs.c:199:37: error: assignment to 'ssize_t (*)(struct file *, struct kobject *, struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, long long int,  long unsigned int)'} from incompatible pointer type 'ssize_t (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, loff_t,  size_t)' {aka 'long int (*)(struct file *, struct kobject *, const struct bin_attribute *, char *, long long int,  long unsigned int)'} [-Werror=incompatible-pointer-types]
     199 |                         nattr->read = sysfs_bin_attr_simple_read;
         |                                     ^
   cc1: some warnings being treated as errors


vim +199 kernel/module/sysfs.c

44c09535de4784 Aaron Tomlin 2022-03-22  165  
ce47f7cbbcadbc Chunhui Li   2024-09-11  166  static int add_notes_attrs(struct module *mod, const struct load_info *info)
44c09535de4784 Aaron Tomlin 2022-03-22  167  {
44c09535de4784 Aaron Tomlin 2022-03-22  168  	unsigned int notes, loaded, i;
44c09535de4784 Aaron Tomlin 2022-03-22  169  	struct module_notes_attrs *notes_attrs;
44c09535de4784 Aaron Tomlin 2022-03-22  170  	struct bin_attribute *nattr;
ce47f7cbbcadbc Chunhui Li   2024-09-11  171  	int ret;
44c09535de4784 Aaron Tomlin 2022-03-22  172  
44c09535de4784 Aaron Tomlin 2022-03-22  173  	/* Count notes sections and allocate structures.  */
44c09535de4784 Aaron Tomlin 2022-03-22  174  	notes = 0;
44c09535de4784 Aaron Tomlin 2022-03-22  175  	for (i = 0; i < info->hdr->e_shnum; i++)
44c09535de4784 Aaron Tomlin 2022-03-22  176  		if (!sect_empty(&info->sechdrs[i]) &&
44c09535de4784 Aaron Tomlin 2022-03-22  177  		    info->sechdrs[i].sh_type == SHT_NOTE)
44c09535de4784 Aaron Tomlin 2022-03-22  178  			++notes;
44c09535de4784 Aaron Tomlin 2022-03-22  179  
44c09535de4784 Aaron Tomlin 2022-03-22  180  	if (notes == 0)
ce47f7cbbcadbc Chunhui Li   2024-09-11  181  		return 0;
44c09535de4784 Aaron Tomlin 2022-03-22  182  
44c09535de4784 Aaron Tomlin 2022-03-22  183  	notes_attrs = kzalloc(struct_size(notes_attrs, attrs, notes),
44c09535de4784 Aaron Tomlin 2022-03-22  184  			      GFP_KERNEL);
44c09535de4784 Aaron Tomlin 2022-03-22  185  	if (!notes_attrs)
ce47f7cbbcadbc Chunhui Li   2024-09-11  186  		return -ENOMEM;
44c09535de4784 Aaron Tomlin 2022-03-22  187  
44c09535de4784 Aaron Tomlin 2022-03-22  188  	notes_attrs->notes = notes;
44c09535de4784 Aaron Tomlin 2022-03-22  189  	nattr = &notes_attrs->attrs[0];
44c09535de4784 Aaron Tomlin 2022-03-22  190  	for (loaded = i = 0; i < info->hdr->e_shnum; ++i) {
44c09535de4784 Aaron Tomlin 2022-03-22  191  		if (sect_empty(&info->sechdrs[i]))
44c09535de4784 Aaron Tomlin 2022-03-22  192  			continue;
44c09535de4784 Aaron Tomlin 2022-03-22  193  		if (info->sechdrs[i].sh_type == SHT_NOTE) {
44c09535de4784 Aaron Tomlin 2022-03-22  194  			sysfs_bin_attr_init(nattr);
44c09535de4784 Aaron Tomlin 2022-03-22  195  			nattr->attr.name = mod->sect_attrs->attrs[loaded].battr.attr.name;
44c09535de4784 Aaron Tomlin 2022-03-22  196  			nattr->attr.mode = 0444;
44c09535de4784 Aaron Tomlin 2022-03-22  197  			nattr->size = info->sechdrs[i].sh_size;
44c09535de4784 Aaron Tomlin 2022-03-22  198  			nattr->private = (void *)info->sechdrs[i].sh_addr;
66bc1a173328de Lukas Wunner 2024-04-06 @199  			nattr->read = sysfs_bin_attr_simple_read;
44c09535de4784 Aaron Tomlin 2022-03-22  200  			++nattr;
44c09535de4784 Aaron Tomlin 2022-03-22  201  		}
44c09535de4784 Aaron Tomlin 2022-03-22  202  		++loaded;
44c09535de4784 Aaron Tomlin 2022-03-22  203  	}
44c09535de4784 Aaron Tomlin 2022-03-22  204  
44c09535de4784 Aaron Tomlin 2022-03-22  205  	notes_attrs->dir = kobject_create_and_add("notes", &mod->mkobj.kobj);
ce47f7cbbcadbc Chunhui Li   2024-09-11  206  	if (!notes_attrs->dir) {
ce47f7cbbcadbc Chunhui Li   2024-09-11  207  		ret = -ENOMEM;
44c09535de4784 Aaron Tomlin 2022-03-22  208  		goto out;
ce47f7cbbcadbc Chunhui Li   2024-09-11  209  	}
44c09535de4784 Aaron Tomlin 2022-03-22  210  
ce47f7cbbcadbc Chunhui Li   2024-09-11  211  	for (i = 0; i < notes; ++i) {
ce47f7cbbcadbc Chunhui Li   2024-09-11  212  		ret = sysfs_create_bin_file(notes_attrs->dir, &notes_attrs->attrs[i]);
ce47f7cbbcadbc Chunhui Li   2024-09-11  213  		if (ret)
44c09535de4784 Aaron Tomlin 2022-03-22  214  			goto out;
ce47f7cbbcadbc Chunhui Li   2024-09-11  215  	}
44c09535de4784 Aaron Tomlin 2022-03-22  216  
44c09535de4784 Aaron Tomlin 2022-03-22  217  	mod->notes_attrs = notes_attrs;
ce47f7cbbcadbc Chunhui Li   2024-09-11  218  	return 0;
44c09535de4784 Aaron Tomlin 2022-03-22  219  
44c09535de4784 Aaron Tomlin 2022-03-22  220  out:
44c09535de4784 Aaron Tomlin 2022-03-22  221  	free_notes_attrs(notes_attrs, i);
ce47f7cbbcadbc Chunhui Li   2024-09-11  222  	return ret;
44c09535de4784 Aaron Tomlin 2022-03-22  223  }
44c09535de4784 Aaron Tomlin 2022-03-22  224  

:::::: The code at line 199 was first introduced by commit
:::::: 66bc1a173328dec3e37c203a999f2a2914c96b56 treewide: Use sysfs_bin_attr_simple_read() helper

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
