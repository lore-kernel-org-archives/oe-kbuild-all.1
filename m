Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0F359A7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042621; cv=none; b=TT/eLtyy2/MPZwCvqH5VyMfjdgCb67Eh2/As2+sJoS3jyLf90OKgbXO+leFb/4qGc0bk9zDEG1qF//R7Yudv/uJ1rNMhmSR5vyiR2I+PtZOkJ2ZbZ6OE95Wud7sUrOGZ3YFCl82ktnqJBLMbL8FtqAi/QqcrImQi/G9nouhPuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042621; c=relaxed/simple;
	bh=1arWq3Zvj3Mt0/rOMKBMXZWHh7LZp1tZue5bT9TwBRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tgoa02l+diGJRY/Ok76D5sVB9hQYZgQFraIeqp3x04uL4JfdR/Pg78sor7o639w+yVCvaLfIqYezC9iaWCV83QXa328v6ozjIFhjM2zPqCquVWHMnaAwuj1zfFeow17YIOyVVxVZNJw24l+/eZRR6/3x4vs/GgzixaH8/drNAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHWyfRFU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHWyfRFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042619; x=1805578619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1arWq3Zvj3Mt0/rOMKBMXZWHh7LZp1tZue5bT9TwBRw=;
  b=UHWyfRFUSSuk3Fd6devMBs0yHvLL8QnaSgs8FKy2jWh7or7Bg4u4PZJo
   bhfYEPvA0a9Lwv4a2yhOK5t3sMsTNv1HZhnhogpXJhtlQ7691kEuZPmuS
   B2ON8uI4HZeSClk3SFhD16DFOlD56CTU6F4Ev+xel4t3hFaYvX1zE54Tt
   wZVqc5dMrggy/ZdKTU83bghr+07L/8QhzMjMIyIbh38Nh00V0IkKdMKUT
   a8KhWCFvQMaOTUi8U8I8ljSSG7OQ2F5S73WLeOxl69rtIcf9o8t28HW5N
   MdZ8WrrgCFI2ukpHMzyXPBDUpED+Um4fAZ4Rwx34BqwI/9eZ/d1zJDgl+
   g==;
X-CSE-ConnectionGUID: XLWMSyOYTDy6psMa7BE6Tw==
X-CSE-MsgGUID: Rtgr1ApbRzeHkvOlz8jMtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75105569"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75105569"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:36:59 -0700
X-CSE-ConnectionGUID: WElW8m/+S2mzc15JSN1zqg==
X-CSE-MsgGUID: Y24QRAcvT9GaZADgwUpxsA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 14:36:52 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3hVD-000000000F7-3EZS;
	Fri, 20 Mar 2026 21:36:17 +0000
Date: Sat, 21 Mar 2026 05:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <john@jagalactic.com>, John Groves <John@groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>
Subject: Re: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
Message-ID: <202603210500.wr4l3DMj-lkp@intel.com>
References: <0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000@email.amazonses.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on mszeredi-fuse/for-next]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/famfs_fuse-Basic-fuse-kernel-ABI-enablement-for-famfs/20260320-152719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000%40email.amazonses.com
patch subject: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260321/202603210500.wr4l3DMj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210500.wr4l3DMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210500.wr4l3DMj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/famfs.c: In function 'famfs_fuse_get_daxdev':
>> fs/fuse/famfs.c:163:32: error: implicit declaration of function 'dax_dev_get' [-Wimplicit-function-declaration]
     163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
         |                                ^~~~~~~~~~~
>> fs/fuse/famfs.c:163:30: error: assignment to 'struct dax_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
         |                              ^


vim +/dax_dev_get +163 fs/fuse/famfs.c

    90	
    91	/**
    92	 * famfs_fuse_get_daxdev() - Retrieve info for a DAX device from fuse server
    93	 *
    94	 * Send a GET_DAXDEV message to the fuse server to retrieve info on a
    95	 * dax device.
    96	 *
    97	 * @fm:     fuse_mount
    98	 * @index:  the index of the dax device; daxdevs are referred to by index
    99	 *          in fmaps, and the server resolves the index to a particular daxdev
   100	 *
   101	 * Returns: 0=success
   102	 *          -errno=failure
   103	 */
   104	static int
   105	famfs_fuse_get_daxdev(struct fuse_mount *fm, const u64 index)
   106	{
   107		struct fuse_daxdev_out daxdev_out = { 0 };
   108		struct fuse_conn *fc = fm->fc;
   109		struct famfs_daxdev *daxdev;
   110		int rc;
   111	
   112		FUSE_ARGS(args);
   113	
   114		/* Store the daxdev in our table */
   115		if (index >= fc->dax_devlist->nslots) {
   116			pr_err("%s: index(%lld) > nslots(%d)\n",
   117			       __func__, index, fc->dax_devlist->nslots);
   118			return -EINVAL;
   119		}
   120	
   121		args.opcode = FUSE_GET_DAXDEV;
   122		args.nodeid = index;
   123	
   124		args.in_numargs = 0;
   125	
   126		args.out_numargs = 1;
   127		args.out_args[0].size = sizeof(daxdev_out);
   128		args.out_args[0].value = &daxdev_out;
   129	
   130		/* Send GET_DAXDEV command */
   131		rc = fuse_simple_request(fm, &args);
   132		if (rc) {
   133			pr_err("%s: rc=%d from fuse_simple_request()\n",
   134			       __func__, rc);
   135			/* Error will be that the payload is smaller than FMAP_BUFSIZE,
   136			 * which is the max we can handle. Empty payload handled below.
   137			 */
   138			return rc;
   139		}
   140	
   141		scoped_guard(rwsem_write, &fc->famfs_devlist_sem) {
   142			daxdev = &fc->dax_devlist->devlist[index];
   143	
   144			/* Abort if daxdev is now valid (races are possible here) */
   145			if (daxdev->valid) {
   146				pr_debug("%s: daxdev already known\n", __func__);
   147				return 0;
   148			}
   149	
   150			/* Verify dev is valid and can be opened and gets the devno */
   151			rc = famfs_verify_daxdev(daxdev_out.name, &daxdev->devno);
   152			if (rc) {
   153				pr_err("%s: rc=%d from famfs_verify_daxdev()\n",
   154				       __func__, rc);
   155				return rc;
   156			}
   157	
   158			daxdev->name = kstrdup(daxdev_out.name, GFP_KERNEL);
   159			if (!daxdev->name)
   160				return -ENOMEM;
   161	
   162			/* This will fail if it's not a dax device */
 > 163			daxdev->devp = dax_dev_get(daxdev->devno);
   164			if (!daxdev->devp) {
   165				pr_warn("%s: device %s not found or not dax\n",
   166					__func__, daxdev_out.name);
   167				kfree(daxdev->name);
   168				daxdev->name = NULL;
   169				return -ENODEV;
   170			}
   171	
   172			wmb(); /* All other fields must be visible before valid */
   173			daxdev->valid = 1;
   174		}
   175	
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
