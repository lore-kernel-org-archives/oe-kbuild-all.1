Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A019EED7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723728163; cv=none; b=EvEWQoyvk7nyho9t+0loK1ybMWP0W4U3w2ztX31+0F+HTcFmIWr8unNH4E/Y/ahJfXw1a4Q6TlmM6Wqhzt1wW/oY9epjtvkE94NyrdLQhFb7WHC0zbqUD/jJMmUBWx1tVic16piCQDWgEg1czDqXYjEaQBVnEBRtI76KohOmTyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723728163; c=relaxed/simple;
	bh=el3EOs7JKoxVaNMRnbCa8wkHiTSwewyosvJPpHhTKE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MndH70VbT9lBk7M6JlILyJx2CLE6xPp7oy2BJvj7z6fGxSUyF3cPhrdfTSQ2PmlmS4oClNkORwDyvPoeEFHz3fGYnbgyNrAfIseTUPmOdnN5XGQ8YdSxq1qvJ6xNHGl/pzX2OhPBROpIKmouKoQ+wRx6NyjekP+jVNQXEr6mmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmk3xg7r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmk3xg7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723728161; x=1755264161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=el3EOs7JKoxVaNMRnbCa8wkHiTSwewyosvJPpHhTKE8=;
  b=Cmk3xg7rMrQ2TMqgpNqZwlgk3I2B7p4LRihBq1ELGs69PYDC2sP0y+XO
   a3qkypvePfndaH881TxkTT7Drj+oXC75bJJpENmP0HIu2hlzrKFNUUCv9
   rn7yOZMoaoBpQJ9UH9BHXyd0kGaBdqkxgueEWshfevrgmf0hyyyDOL+hn
   YMEXpk5Bf7qn4465OFyR2qUhpFI9XD78v0A3G4GE1L36GD2KABP0YAdwf
   v/yvQdEQyDd21OLh69wHRB8v76+6jO0ifBXrKPSUmx/nnKkqwsZE0UToO
   gKAjgw1dZc1PVNG/P508MxjqwZFU4TFlHCgGKR4tJZXwqbNEc2QTduYbf
   A==;
X-CSE-ConnectionGUID: tynh2twbQ2mbc4TmS6w2xQ==
X-CSE-MsgGUID: 5BUgOubkTFCoG3RfYCDY9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22121708"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="22121708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 06:22:21 -0700
X-CSE-ConnectionGUID: y0Q1h2DNT2CA1xGLkx+YpA==
X-CSE-MsgGUID: DnOtDEs4Q+ul+F1NNLgaCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="82550076"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2024 06:22:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seaQk-0003cY-0J;
	Thu, 15 Aug 2024 13:22:18 +0000
Date: Thu, 15 Aug 2024 21:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC dlm/next 08/12] kobject: add kset_type_create_and_add()
 helper
Message-ID: <202408152013.QUsFNfUM-lkp@intel.com>
References: <20240814143414.1877505-9-aahringo@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814143414.1877505-9-aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on teigland-dlm/next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc3 next-20240815]
[cannot apply to gfs2/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/dlm-introduce-dlm_find_lockspace_name/20240814-233736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
patch link:    https://lore.kernel.org/r/20240814143414.1877505-9-aahringo%40redhat.com
patch subject: [RFC dlm/next 08/12] kobject: add kset_type_create_and_add() helper
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240815/202408152013.QUsFNfUM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408152013.QUsFNfUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408152013.QUsFNfUM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kobject.c:962: warning: Function parameter or struct member 'ktype' not described in 'kset_create'


vim +962 lib/kobject.c

b727c702896f88 Greg Kroah-Hartman 2007-09-27  942  
b727c702896f88 Greg Kroah-Hartman 2007-09-27  943  /**
ed856349dc0886 Tobin C. Harding   2019-05-02  944   * kset_create() - Create a struct kset dynamically.
b727c702896f88 Greg Kroah-Hartman 2007-09-27  945   *
b727c702896f88 Greg Kroah-Hartman 2007-09-27  946   * @name: the name for the kset
b727c702896f88 Greg Kroah-Hartman 2007-09-27  947   * @uevent_ops: a struct kset_uevent_ops for the kset
b727c702896f88 Greg Kroah-Hartman 2007-09-27  948   * @parent_kobj: the parent kobject of this kset, if any.
b727c702896f88 Greg Kroah-Hartman 2007-09-27  949   *
b727c702896f88 Greg Kroah-Hartman 2007-09-27  950   * This function creates a kset structure dynamically.  This structure can
b727c702896f88 Greg Kroah-Hartman 2007-09-27  951   * then be registered with the system and show up in sysfs with a call to
b727c702896f88 Greg Kroah-Hartman 2007-09-27  952   * kset_register().  When you are finished with this structure, if
b727c702896f88 Greg Kroah-Hartman 2007-09-27  953   * kset_register() has been called, call kset_unregister() and the
b727c702896f88 Greg Kroah-Hartman 2007-09-27  954   * structure will be dynamically freed when it is no longer being used.
b727c702896f88 Greg Kroah-Hartman 2007-09-27  955   *
b727c702896f88 Greg Kroah-Hartman 2007-09-27  956   * If the kset was not able to be created, NULL will be returned.
b727c702896f88 Greg Kroah-Hartman 2007-09-27  957   */
b727c702896f88 Greg Kroah-Hartman 2007-09-27  958  static struct kset *kset_create(const char *name,
9cd43611ccfb46 Emese Revfy        2009-12-31  959  				const struct kset_uevent_ops *uevent_ops,
9b20142ac9c1ca Alexander Aring    2024-08-14  960  				struct kobject *parent_kobj,
9b20142ac9c1ca Alexander Aring    2024-08-14  961  				const struct kobj_type *ktype)
b727c702896f88 Greg Kroah-Hartman 2007-09-27 @962  {
b727c702896f88 Greg Kroah-Hartman 2007-09-27  963  	struct kset *kset;
d9cd8f37855b01 Dave Young         2009-05-11  964  	int retval;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  965  
b727c702896f88 Greg Kroah-Hartman 2007-09-27  966  	kset = kzalloc(sizeof(*kset), GFP_KERNEL);
b727c702896f88 Greg Kroah-Hartman 2007-09-27  967  	if (!kset)
b727c702896f88 Greg Kroah-Hartman 2007-09-27  968  		return NULL;
b7165ebbf0898b Kees Cook          2013-06-06  969  	retval = kobject_set_name(&kset->kobj, "%s", name);
d9cd8f37855b01 Dave Young         2009-05-11  970  	if (retval) {
d9cd8f37855b01 Dave Young         2009-05-11  971  		kfree(kset);
d9cd8f37855b01 Dave Young         2009-05-11  972  		return NULL;
d9cd8f37855b01 Dave Young         2009-05-11  973  	}
b727c702896f88 Greg Kroah-Hartman 2007-09-27  974  	kset->uevent_ops = uevent_ops;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  975  	kset->kobj.parent = parent_kobj;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  976  
9b20142ac9c1ca Alexander Aring    2024-08-14  977  	kset->kobj.ktype = ktype;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  978  	kset->kobj.kset = NULL;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  979  
b727c702896f88 Greg Kroah-Hartman 2007-09-27  980  	return kset;
b727c702896f88 Greg Kroah-Hartman 2007-09-27  981  }
b727c702896f88 Greg Kroah-Hartman 2007-09-27  982  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
