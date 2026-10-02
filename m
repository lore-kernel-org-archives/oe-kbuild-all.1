Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA79133262B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 02:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790908203; cv=none; b=HstvoEEjl09pL5J4LZMUeyjbPZuzAFW7WcclzH9YraLLuMw87UcZ9jQDQwfVodDGh3ycMKxF+UFPEZnrY0nBS3pWDAoo0Z1WWMTEjHC2IDY9snSh3IY16pt11vzw7q4ghPAFI2nouMQTdEwYTunw4nlaZIpjkNmBtkKNn1ay5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790908203; c=relaxed/simple;
	bh=oRTzBsn03kzmurFOApr4DJ1h9d6gbpcRXpnWJOA9IWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dn2qwQpqM3cnNp0OcWIiRMIwUzyyik9gFCP4QsH/7wJIkVKUL1Xx8lMMWGNdffd0dWpwHovdd0DfBxEU0ERr61DgxS7vYDqmVgWeuUhKZjJkLjO/V4r8FtaiHv68YHi6hbZqLgLa8QpDIjoIpgG6S+9treRCNqx8a2ky9VSgvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c07Cx6vf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c07Cx6vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790908201; x=1822444201;
  h=date:from:to:cc:subject:message-id;
  bh=oRTzBsn03kzmurFOApr4DJ1h9d6gbpcRXpnWJOA9IWM=;
  b=c07Cx6vfl4gn0Vxxe8ANR2+z7YQkOY0Q1NxUv8BsEStXNFciJavVuy/K
   6eolgCCbZE3z2VT9+8e60xy62jjVCPluXYV8GbIy6+pZjdWBye/muntY8
   0nPRTO7BiRyA+fTZtbBIgTZirBp+rgGdJyYyuFNShmTxr0s7OAd+qaOkS
   3+di71Xz/1HyDtdhT5OgktjXnHTzsZ2U+sPQDc/noyJXXnsFnVAa6+BiO
   T+IFYLDZRxuIQS8xvKnOfEpxM4azOtu6NILXP5ViiUJXapEDxhjRVZ93q
   dFYhfyuE0YP+JJ+rPeBFnsTL8Dj00Wpw9Hfwnc9Xx6/FSEwDbQmuEqQVh
   w==;
X-CSE-ConnectionGUID: D/mxpgkwRA68GRfO2ffXNQ==
X-CSE-MsgGUID: pYGgwbWOT4qfOWNRozJ13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90890798"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90890798"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 19:29:58 -0700
X-CSE-ConnectionGUID: WgZgub2NS/GHUp0flMDi5g==
X-CSE-MsgGUID: KBSl4Ax+Sme4zBGI6vOtvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="304104459"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2026 19:29:55 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCT21-000000000MB-2jFH;
	Fri, 02 Oct 2026 02:29:53 +0000
Date: Fri, 02 Oct 2026 04:29:37 +0200
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 85/87]
 drivers/hwtracing/gtrace/gtrace-fwnode.c:17:5: warning: no previous prototype
 for 'gtrace_of_parse_outconns'
Message-ID: <202610020411.xNkUOJej-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 5c381ad05935a6c1e0108a97d1197952ca46201e [85/87] hwtracing: rvtrace: Move to fwnode_* APIs
config: i386-randconfig-2200-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020411.xNkUOJej-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020411.xNkUOJej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020411.xNkUOJej-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/gtrace/gtrace-fwnode.c:17:5: warning: no previous prototype for 'gtrace_of_parse_outconns' [-Wmissing-prototypes]
      17 | int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwtracing/gtrace/gtrace-fwnode.c:105:5: warning: no previous prototype for 'rvtrace_parse_inconns' [-Wmissing-prototypes]
     105 | int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/gtrace_of_parse_outconns +17 drivers/hwtracing/gtrace/gtrace-fwnode.c

2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   10  
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   11  /*
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   12   * Parse the "out-ports" graph of the component node and fill pdata->outconns.
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   13   * Return: 0 on success or when there are no output ports
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   14   *         -EPROBE_DEFER if a destination is not registered yet
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   15   *         negative error code otherwise.
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   16   */
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01  @17  int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   18  {
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   19  	struct fwnode_handle *parent, *ep_node, *rep_node, *rdev_node;
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   20  	struct fwnode_endpoint ep = { 0 };
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   21  	struct fwnode_endpoint rep = { 0 };
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   22  	struct gtrace_connection *conn;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   23  	int ret = 0, i = 0;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   24  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   25  	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "out-ports");
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   26  	if (!parent)
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   27  		return 0;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   28  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   29  	pdata->nr_outconns = fwnode_graph_get_endpoint_count(parent, 0);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   30  	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   31  				       sizeof(*pdata->outconns), GFP_KERNEL);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   32  	if (!pdata->outconns) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   33  		ret = -ENOMEM;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   34  		goto done;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   35  	}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   36  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   37  	fwnode_graph_for_each_endpoint(parent, ep_node) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   38  		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   39  		if (!conn) {
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   40  			fwnode_handle_put(ep_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   41  			ret = -ENOMEM;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   42  			break;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   43  		}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   44  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   45  		ret = fwnode_graph_parse_endpoint(ep_node, &ep);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   46  		if (ret) {
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   47  			fwnode_handle_put(ep_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   48  			break;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   49  		}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   50  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   51  		rep_node = fwnode_graph_get_remote_endpoint(ep_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   52  		if (!rep_node) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   53  			ret = -ENODEV;
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   54  			fwnode_handle_put(ep_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   55  			break;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   56  		}
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   57  		rdev_node = fwnode_graph_get_port_parent(rep_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   58  
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   59  		ret = fwnode_graph_parse_endpoint(rep_node, &rep);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   60  		if (ret) {
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   61  			fwnode_handle_put(ep_node);
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   62  			fwnode_handle_put(rep_node);
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   63  			fwnode_handle_put(rdev_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   64  			break;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   65  		}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   66  
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   67  		conn->src_port = ep.port;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   68  		conn->src_fwnode = dev_fwnode(pdata->dev);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   69  		/* The 'src_comp' is set by gtrace_register_component() */
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   70  		conn->src_comp = NULL;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   71  		conn->dest_port = rep.port;
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   72  		conn->dest_fwnode = rdev_node;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   73  		fwnode_handle_get(conn->dest_fwnode);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   74  		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   75  		if (!conn->dest_comp) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   76  			ret = -EPROBE_DEFER;
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   77  			fwnode_handle_put(ep_node);
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   78  			fwnode_handle_put(rep_node);
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   79  			fwnode_handle_put(rdev_node);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   80  			break;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   81  		}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   82  
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   83  		pdata->outconns[i] = conn;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   84  		i++;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   85  	}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   86  
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   87  done:
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   88  	if (ret) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   89  		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   90  			conn = pdata->outconns[i];
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   91  			if (conn && conn->dest_fwnode)
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   92  				fwnode_handle_put(conn->dest_fwnode);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   93  		}
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   94  	}
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   95  	fwnode_handle_put(parent);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   96  	return ret;
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   97  }
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01   98  EXPORT_SYMBOL_GPL(gtrace_parse_outconns);
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01   99  
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01  100  /*
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01  101   * Parse the "out-ports" graph of the component node and allocate pdata->inconns.
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01  102   *
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01  103   * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
2533ea70f41f2e1 drivers/hwtracing/gtrace/gtrace-of.c     Anup Patel 2026-10-01  104   */
5c381ad05935a6c drivers/hwtracing/gtrace/gtrace-fwnode.c Sunil V L  2026-10-01 @105  int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)

:::::: The code at line 17 was first introduced by commit
:::::: 2533ea70f41f2e1b6534c0bdfc90e83dad7bbf39 gtrace: Add RISC-V platform driver for the gtrace framework

:::::: TO: Anup Patel <anup.patel@oss.qualcomm.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
