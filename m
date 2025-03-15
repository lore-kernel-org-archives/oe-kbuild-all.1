Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631753BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742029812; cv=none; b=QENSd3SUfT8nHEZwmaFNvhHvB+P/GSD522NHpJ8MNqVCChCbVBWYp+M/94ny8LH85ptP3jRMcAXJp1TXrE9hpgBfn6jwHKjRaQl5mWIwOBHN8OGnAo9Zm6FtNjR3J1hhOGgi3Jvu45Y5y86paYRYy5uEE7gQUKqNokr1yvKEU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742029812; c=relaxed/simple;
	bh=5pt83pmPI+8JBtS0NrP1sL4gwRg0serC+2nKWAOy04E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xx1ErUioMWAc+Rf6Zn7LwphZ8FbEU9fI9Kom61hdreFH39PE0gfNvrJbNm12kggEZGcKZeehzzLLz5Vu5ra+4Kd6E1UiVjX0nprQSp7/Eg091Nqkm22M+YRf36IVDU8Q7DTuh/HiiNAmcdd05UkQwk81QBqQsB02MI6NA3e92QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8kL+RIv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8kL+RIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742029811; x=1773565811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pt83pmPI+8JBtS0NrP1sL4gwRg0serC+2nKWAOy04E=;
  b=I8kL+RIvhpozjPvp0RMknmsT0Wm8EOFzrOrOJt2ygUhK6VKmOtxLYLnr
   r2k2VJNRSQGrE09SCWgwpqnkVPp9BswAeAREo3kBk3LJEfW9a1d8x1Enw
   mXiwYEnwRwJyz+dwBsc9B5rAguARZNOHsxWA4bf0Ow19kjJi8SMtnyUY2
   3BFpoqYMsCqmvfhMk9Wqy4/aNgG++0gurXrRbAacJO920akz273ZjHTU0
   v56umt+kHQhGZcta34mIZyvu/qA7fv5Dg8skvvU+CDlu1G+Ab1W8JKxuF
   441a4s8PEKCrgJdpNXUClY8drk4O9EV4btTMQ+Vk7c0WqsW8PVvysz0MC
   Q==;
X-CSE-ConnectionGUID: prGv7ZBpSU6DIE8hWXbpXA==
X-CSE-MsgGUID: ZtvTJBX+TEiu4JtUF1cRzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42430588"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="42430588"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:10:10 -0700
X-CSE-ConnectionGUID: IKbzrX1uQdSWeW8IYBqdkA==
X-CSE-MsgGUID: YOPAN9rsSgu0PeGJlejdBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126691647"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2025 02:10:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNWx-000BC5-02;
	Sat, 15 Mar 2025 09:10:07 +0000
Date: Sat, 15 Mar 2025 17:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:netns-debugfs 1/1] fs/debugfs/netns.c:14:9: error: expected
 ';' before 'int'
Message-ID: <202503151723.984UQxig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git netns-debugfs
head:   e06d7dd780ab4a50f85115f8ee988e588e4aad57
commit: e06d7dd780ab4a50f85115f8ee988e588e4aad57 [1/1] net: add a debugfs directory for showing refcount tracking info
config: i386-buildonly-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151723.984UQxig-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151723.984UQxig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151723.984UQxig-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/debugfs/netns.c:14:9: error: expected ';' before 'int'
      14 | unisgned int debugfs_net_id;
         |         ^~~~
         |         ;
   fs/debugfs/netns.c: In function 'debugfs_exit_net':
>> fs/debugfs/netns.c:100:34: error: 'dnet' undeclared (first use in this function); did you mean 'net'?
     100 |         debugfs_remove_recursive(dnet->netdir);
         |                                  ^~~~
         |                                  net
   fs/debugfs/netns.c:100:34: note: each undeclared identifier is reported only once for each function it appears in
   fs/debugfs/netns.c: At top level:
>> fs/debugfs/netns.c:111:1: warning: no previous prototype for 'debugfs_net_init' [-Wmissing-prototypes]
     111 | debugfs_net_init(void)
         | ^~~~~~~~~~~~~~~~
>> fs/debugfs/netns.c:120:1: warning: no previous prototype for 'debugfs_net_exit' [-Wmissing-prototypes]
     120 | debugfs_net_exit(void)
         | ^~~~~~~~~~~~~~~~
>> fs/debugfs/netns.c:103:33: warning: 'debugfs_net_ops' defined but not used [-Wunused-variable]
     103 | static struct pernet_operations debugfs_net_ops = {
         |                                 ^~~~~~~~~~~~~~~


vim +14 fs/debugfs/netns.c

    13	
  > 14	unisgned int debugfs_net_id;
    15	struct debugfs_net {
    16		struct dentry *netdir;
    17		struct dentry *refcnt;
    18	};
    19	
    20	static int
    21	netns_ref_show(struct seq_file *f, void *v)
    22	{
    23		struct net *net = f->private;
    24		char *buf;
    25		int len;
    26	
    27		buf = kmalloc(4096, GFP_KERNEL);
    28		if (!buf)
    29			return -ENOMEM;
    30	
    31		len = ref_tracker_dir_snprint(&net->refcnt_tracker, buf, 4096);
    32		seq_write(f, buf, len);
    33		kfree(buf);
    34	
    35		return 0;
    36	}
    37	
    38	static int
    39	netns_ref_open(struct inode *inode, struct file *filp)
    40	{
    41		int ret;
    42		struct net *net = inode->i_private;
    43	
    44		ret = single_open(filp, netns_ref_show, net);
    45	
    46		if (!ret) {
    47			if (!maybe_get_net(net)) {
    48				single_release(inode, filp);
    49				/* If we can't get a ref, pretend it's not there */
    50				ret = -ENOENT;
    51			}
    52		}
    53		return ret;
    54	}
    55	
    56	static int
    57	netns_ref_release(struct inode *inode, struct file *filp)
    58	{
    59		struct net *net = inode->i_private;
    60	
    61		put_net(net);
    62		return single_release(inode, filp);
    63	}
    64	
    65	static const struct file_operations netns_ref_fops = {
    66		.owner		= THIS_MODULE,
    67		.open		= netns_ref_open,
    68		.read		= seq_read,
    69		.llseek		= seq_lseek,
    70		.release	= netns_ref_release,
    71	};
    72	
    73	static int
    74	debugfs_init_net(struct net *net)
    75	{
    76		struct debugfs_net *dnet = net_generic(net, debugfs_net_id);
    77		char name[11]; /* 10 decimal digits + NULL term */
    78		int len;
    79	
    80		len = snprintf(name, sizeof(name), "%u", net->ns.inum);
    81		if (len >= sizeof(name))
    82			return -EOVERFLOW;
    83	
    84		dnet->netdir = debugfs_create_dir(name, topdir);
    85		if (IS_ERR(dnet->netdir))
    86			return PTR_ERR(dnet->netdir);
    87	
    88		dnet->refcnt = debugfs_create_file(name, S_IFREG | 0400, dnet->netdir, net, &netns_ref_fops);
    89		if (IS_ERR(dnet->refcnt)) {
    90			debugfs_remove(dnet->netdir);
    91			return PTR_ERR(dnet->refcnt);
    92		}
    93	
    94		return 0;
    95	}
    96	
    97	static void
    98	debugfs_exit_net(struct net *net)
    99	{
 > 100		debugfs_remove_recursive(dnet->netdir);
   101	}
   102	
 > 103	static struct pernet_operations debugfs_net_ops = {
   104		.init = debugfs_init_net,
   105		.exit = debugfs_exit_net,
   106		.id = &debugfs_net_id,
   107		.size = sizeof(struct debugfs_net),
   108	};
   109	
   110	int __init
 > 111	debugfs_net_init(void)
   112	{
   113		topdir = debugfs_create_dir("netns", NULL);
   114		if (IS_ERR(topdir))
   115			return PTR_ERR(topdir);
   116		return 0;
   117	}
   118	
   119	void __exit
 > 120	debugfs_net_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
