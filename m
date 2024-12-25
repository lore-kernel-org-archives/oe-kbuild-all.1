Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357713A3F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735150672; cv=none; b=hdx5LFMJgg5vg5XOcEej+DhPM8kmZic66EYy5zQ9DfzwiDjkgua0ty4U98x3ZrZJOEy/oWkPOlv6FGt2BK+X4W2J4BJLtiA6A6LhU/ONos3TiutzmjlAaEo7X/QT6c9EcKVjOpqETEbKzwr6d3bPes5OXFAg/kt/phJEJyqtm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735150672; c=relaxed/simple;
	bh=sv0SfwNRezfA1dAi3A/s+Y15TiwifCvBHu/dNmEmdxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcGkGhu0r+ZUc9phETnYja3iEZ9ioqBnBFXFLkCWc/mV15FVw06bVEfv6ho354UwcZoeo79dV7VWxXTa8nT/NVQN6qAO8jFsoPqlM54XZTCYH2evwinJWRSvhxEvhx3M9PJCedp6cuc5kOxBFx6//3YfCn4TyRkFL0SqTtnAGkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhTQHByH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhTQHByH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735150671; x=1766686671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sv0SfwNRezfA1dAi3A/s+Y15TiwifCvBHu/dNmEmdxA=;
  b=WhTQHByHSiqC9w4pfED77DaTDPKjKrxFGVPZ3rqYFMnd2y6KdVSeywft
   5FV7ht8W+FcoYKL3hjwls/I2ZcpfTURnRJLImIjc4Mcm7OkWssCZ7h//0
   +YrpoyLYtxFoa9SWptfzV1T/g8+vgLPkUhkBay6XFReDBHed1dgP7VF7z
   UIOnFlDcQ+g0lDoC9EkGfTf2lrJ4WjJ6QFQq82eQK0wteND6ivr2R5XlP
   u3dkcjL/XKAu6AzDJqNV13pOVtCYB5y9B3a7nOTkivQr/2LtiYf7NSylg
   RLoRPqNase6SpDHbwd+ZSemjQ4wjOXT5OINs3Wg4QdrnfGxh0KxH20A//
   Q==;
X-CSE-ConnectionGUID: DVLLzkD2TQ+3LCSXXYVA6w==
X-CSE-MsgGUID: Eo689U27Sjimtg2ZUsf6Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46963644"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="46963644"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:17:49 -0800
X-CSE-ConnectionGUID: imsLCiM6SaK+2mS9KTd+6g==
X-CSE-MsgGUID: o0zVLLTdRU2Nuy8LV/zW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104834465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Dec 2024 10:17:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQVx3-00024K-0n;
	Wed, 25 Dec 2024 18:17:45 +0000
Date: Thu, 26 Dec 2024 02:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [trondmy-nfs:testing 3/3] net/sunrpc/debugfs.c:78:21: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202412260244.W95nZtZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   12e66773269367f89700972348d41910369b60f4
commit: 12e66773269367f89700972348d41910369b60f4 [3/3] SUNRPC: display total RPC tasks for RPC client
config: sh-randconfig-r111-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260244.W95nZtZp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241226/202412260244.W95nZtZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260244.W95nZtZp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/debugfs.c:78:21: sparse: sparse: cast removes address space '__rcu' of expression
--
>> net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/sunrpc/clnt.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/__rcu +78 net/sunrpc/debugfs.c

    70	
    71	static void
    72	tasks_stop(struct seq_file *f, void *v)
    73		__releases(&clnt->cl_lock)
    74	{
    75		struct rpc_clnt *clnt = f->private;
    76		spin_unlock(&clnt->cl_lock);
    77		seq_printf(f, "clnt[%pISpc] RPC tasks[%d]\n",
  > 78			   (struct sockaddr *)&clnt->cl_xprt->addr,
    79			   atomic_read(&clnt->cl_task_count));
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
