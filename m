Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A15684
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 19:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692646358; x=1724182358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72kmDEFmeU7mVyB506BEJjFMLfGfUXttL4F3h4XteOE=;
  b=i8aPBCYojNmdeXyAi2YATBnX1gGRdBR4IBGQq+FB2mYvAmxY9b6BUKDi
   5LEiXilSPa5/Z/EYML9evgBqq2oZZTWOXLXgKxU+GlYBWz2Z/MaBdNf1b
   NqEXEt90/uW8KSLX742a2dXsgcpbLXMOEnkVQ2MsMNFn5XRo5sC2V1HRX
   PPKodegLZWzKFlEhPtThKEaEVnTTSJ60VxrhL/d/gAsuyLSOGfVqRhQI7
   53C87bFamXFqADlanB92uRopDCvjKd9knFB1nYoDRnQGHN4AJ9P+T2k/s
   /uIci1Vv3CgCwoaErpeRLEVh7Cr/50t/J0WKHZBFwaSkbpc6dlHprztXZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363851646"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="363851646"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 12:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735950336"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="735950336"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 12:32:35 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYAde-0000qS-0w;
	Mon, 21 Aug 2023 19:32:34 +0000
Date: Tue, 22 Aug 2023 03:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [cilium:pr/meta-new 3/6] drivers/net/meta.c:487:5: warning: no
 previous prototype for 'meta_prog_attach'
Message-ID: <202308220331.kgOYAhsj-lkp@intel.com>
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
commit: 921b3699f2e37cf6bf54adc3c8394c30aaf63af2 [3/6] meta, bpf: Add meta device driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308220331.kgOYAhsj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220331.kgOYAhsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220331.kgOYAhsj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/meta.c:487:5: warning: no previous prototype for 'meta_prog_attach' [-Wmissing-prototypes]
     487 | int meta_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/meta.c:528:5: warning: no previous prototype for 'meta_prog_detach' [-Wmissing-prototypes]
     528 | int meta_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/meta.c:560:5: warning: no previous prototype for 'meta_prog_query' [-Wmissing-prototypes]
     560 | int meta_prog_query(const union bpf_attr *attr, union bpf_attr __user *uattr)
         |     ^~~~~~~~~~~~~~~


vim +/meta_prog_attach +487 drivers/net/meta.c

   486	
 > 487	int meta_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
   488	{
   489		struct bpf_mprog_entry *entry, *entry_new;
   490		struct bpf_prog *replace_prog = NULL;
   491		struct net_device *dev;
   492		int ret;
   493	
   494		rtnl_lock();
   495		dev = meta_dev_fetch(current->nsproxy->net_ns, attr->target_ifindex,
   496				     attr->attach_type);
   497		if (IS_ERR(dev)) {
   498			ret = PTR_ERR(dev);
   499			goto out;
   500		}
   501		entry = meta_entry_fetch(dev, true);
   502		if (attr->attach_flags & BPF_F_REPLACE) {
   503			replace_prog = bpf_prog_get_type(attr->replace_bpf_fd,
   504							 prog->type);
   505			if (IS_ERR(replace_prog)) {
   506				ret = PTR_ERR(replace_prog);
   507				replace_prog = NULL;
   508				goto out;
   509			}
   510		}
   511		ret = bpf_mprog_attach(entry, &entry_new, prog, NULL, replace_prog,
   512				       attr->attach_flags, attr->relative_fd,
   513				       attr->expected_revision);
   514		if (!ret) {
   515			if (entry != entry_new) {
   516				meta_entry_update(dev, entry_new);
   517				meta_entry_sync();
   518			}
   519			bpf_mprog_commit(entry);
   520		}
   521	out:
   522		if (replace_prog)
   523			bpf_prog_put(replace_prog);
   524		rtnl_unlock();
   525		return ret;
   526	}
   527	
 > 528	int meta_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog)
   529	{
   530		struct bpf_mprog_entry *entry, *entry_new;
   531		struct net_device *dev;
   532		int ret;
   533	
   534		rtnl_lock();
   535		dev = meta_dev_fetch(current->nsproxy->net_ns, attr->target_ifindex,
   536				     attr->attach_type);
   537		if (IS_ERR(dev)) {
   538			ret = PTR_ERR(dev);
   539			goto out;
   540		}
   541		entry = meta_entry_fetch(dev, false);
   542		if (!entry) {
   543			ret = -ENOENT;
   544			goto out;
   545		}
   546		ret = bpf_mprog_detach(entry, &entry_new, prog, NULL, attr->attach_flags,
   547				       attr->relative_fd, attr->expected_revision);
   548		if (!ret) {
   549			if (!bpf_mprog_total(entry_new))
   550				entry_new = NULL;
   551			meta_entry_update(dev, entry_new);
   552			meta_entry_sync();
   553			bpf_mprog_commit(entry);
   554		}
   555	out:
   556		rtnl_unlock();
   557		return ret;
   558	}
   559	
 > 560	int meta_prog_query(const union bpf_attr *attr, union bpf_attr __user *uattr)
   561	{
   562		struct bpf_mprog_entry *entry;
   563		struct net_device *dev;
   564		int ret;
   565	
   566		rtnl_lock();
   567		dev = meta_dev_fetch(current->nsproxy->net_ns, attr->query.target_ifindex,
   568				     attr->query.attach_type);
   569		if (IS_ERR(dev)) {
   570			ret = PTR_ERR(dev);
   571			goto out;
   572		}
   573		entry = meta_entry_fetch(dev, false);
   574		if (!entry) {
   575			ret = -ENOENT;
   576			goto out;
   577		}
   578		ret = bpf_mprog_query(attr, uattr, entry);
   579	out:
   580		rtnl_unlock();
   581		return ret;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
