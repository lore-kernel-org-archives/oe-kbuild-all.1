Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337A1FC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692657706; x=1724193706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fkvg1EjNITAyxuHoQ77pn0f9ST2rjKu8gaoKFqcy0Y=;
  b=IqapmmFOE8ADez6xmUZqNEuBf3vogwgAzLabkct0O8+HIRXa9+lTpdWH
   k1YvhBjKi9y6CU4qvJRUM8T+Lhwl2K0chXOb7Z0OATIi7wqsj8uZusa/t
   +Qxjl81R4azsACL9OxLqwxd3CItg8wHG8CoJQbrLZJTdbAFhNIkxxEdw+
   CpM8cNvO1cyMwPOQE0v1CnbHvPCtgOY59M9xAEhf85iEe1eNa2tJ3LOfj
   kx3kwrFMN0CU/cUg7mDcgZWfGA6CpuCINWMv0vsJw80cPgENnMEEtvA19
   6vTn/NGkt1o0LC0eAYR02V4qlYEkyVxGMQ+3FtQoIELLXYbfK8uBVNZHw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371144764"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="371144764"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 15:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806076474"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="806076474"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 15:41:44 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYDZV-00010q-1W;
	Mon, 21 Aug 2023 22:40:35 +0000
Date: Tue, 22 Aug 2023 06:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/meta-new 4/6] drivers/net/meta.c:750:5: warning: no
 previous prototype for 'meta_link_attach'
Message-ID: <202308220619.4j5t1KXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/meta-new
head:   015a11d0dc5493160aa83019215b67fb71ec20bc
commit: 0fb62c759502876714be3632b3f1ac8619c18af8 [4/6] meta, bpf: Add bpf link support for meta device
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308220619.4j5t1KXF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220619.4j5t1KXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220619.4j5t1KXF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/meta.c:492:5: warning: no previous prototype for 'meta_prog_attach' [-Wmissing-prototypes]
     492 | int meta_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/meta.c:533:5: warning: no previous prototype for 'meta_prog_detach' [-Wmissing-prototypes]
     533 | int meta_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/meta.c:565:5: warning: no previous prototype for 'meta_prog_query' [-Wmissing-prototypes]
     565 | int meta_prog_query(const union bpf_attr *attr, union bpf_attr __user *uattr)
         |     ^~~~~~~~~~~~~~~
>> drivers/net/meta.c:750:5: warning: no previous prototype for 'meta_link_attach' [-Wmissing-prototypes]
     750 | int meta_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~


vim +/meta_link_attach +750 drivers/net/meta.c

   749	
 > 750	int meta_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   751	{
   752		struct bpf_link_primer link_primer;
   753		struct net_device *dev;
   754		struct meta_link *meta;
   755		int ret;
   756	
   757		rtnl_lock();
   758		dev = meta_dev_fetch(current->nsproxy->net_ns,
   759				     attr->link_create.target_ifindex,
   760				     attr->link_create.attach_type);
   761		if (IS_ERR(dev)) {
   762			ret = PTR_ERR(dev);
   763			goto out;
   764		}
   765		meta = kzalloc(sizeof(*meta), GFP_USER);
   766		if (!meta) {
   767			ret = -ENOMEM;
   768			goto out;
   769		}
   770		ret = meta_link_init(meta, &link_primer, dev, prog);
   771		if (ret) {
   772			kfree(meta);
   773			goto out;
   774		}
   775		ret = meta_link_prog_attach(&meta->link,
   776					    attr->link_create.flags,
   777					    attr->link_create.meta.relative_fd,
   778					    attr->link_create.meta.expected_revision);
   779		if (ret) {
   780			meta->dev = NULL;
   781			bpf_link_cleanup(&link_primer);
   782			goto out;
   783		}
   784		ret = bpf_link_settle(&link_primer);
   785	out:
   786		rtnl_unlock();
   787		return ret;
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
