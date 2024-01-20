Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A3EEDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705758524; cv=none; b=jeGWvQ/Umu6JbkBt4BJ30NZRZ36qRXPt5Xsf8BVHtyFKyTVh2TLbk97zjMvYK0xu0FrtctgrXLbBD69pKmbFhjizOFnptGaABTIYMyyAyTvxSL7yCBcx+aQUXTMI2xKkwjzTbZAcZn+9yLDwLSH1dYljDZCbKPUQNbx6gRHLpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705758524; c=relaxed/simple;
	bh=m7imhMKSdTdJ5ydf3ZsGHyNCubPOqsBtBgYGic8Yrok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5AhxhM8aen69SxMkrLy9NOTh03fWWy3kXCrWQrx88tOEY/c9RRZeIM36rUJTKDAsY/UNx0egFsb6FvL2imOUb5Z05lgw/WIbPhiTFmNFmrVzkM2PUffJv7dcklgABScnEfeBFr1ryf/hSEMZZk4Mafd10B3z7GZcvQ8GU+T34s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrkHE97J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrkHE97J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705758522; x=1737294522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7imhMKSdTdJ5ydf3ZsGHyNCubPOqsBtBgYGic8Yrok=;
  b=FrkHE97Jb37AlocD7RBdcZlldMOgHfOfSgGC14FQ6D7y+U5/JgeWc1sN
   E2Hcqi43ckkFORThCvUNmwUXpta7WI7YxjBZhQUjIJxhMgchgWaH5/Bqb
   EOww0VfFM3oGuW8KJOO6+OK5tOXkCmhDKWLn4VirS2MQCZE9V6o54XRyf
   oygMAqt8oPlofQmgwTfJjX1ptQKsZLuhPB/K8IIDKyPcUuclPMUAHbUsm
   lBFL3bLpZK2Rby9MJkvYGu0SEeo6lkZVzu+q8WiJFni2wK6TN3yQQVQT7
   im1ZfZW+B+1VG/GUgj5EV3N8x/P0AlTOkUve835HkQyANb9j7/Pk6I8oc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="19513679"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="19513679"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 05:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="904413133"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="904413133"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 05:48:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRBi9-000580-36;
	Sat, 20 Jan 2024 13:48:37 +0000
Date: Sat, 20 Jan 2024 21:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Amery Hung <ameryhung@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 1/8] net_sched: Introduce eBPF based Qdisc
Message-ID: <202401202131.VhVYkEh1-lkp@intel.com>
References: <232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung@bytedance.com>

Hi Amery,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on v6.7]
[cannot apply to bpf-next/master bpf/master net/main net-next/main linus/master horms-ipvs/master next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amery-Hung/net_sched-Introduce-eBPF-based-Qdisc/20240118-055917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/232881645a5c4c05a35df4ff1f08a19ef9a02662.1705432850.git.amery.hung%40bytedance.com
patch subject: [RFC PATCH v7 1/8] net_sched: Introduce eBPF based Qdisc
config: i386-randconfig-013-20240120 (https://download.01.org/0day-ci/archive/20240120/202401202131.VhVYkEh1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202131.VhVYkEh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202131.VhVYkEh1-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/filter.c: In function 'tc_qdisc_is_valid_access':
>> net/core/filter.c:8929:9: error: implicit declaration of function 'bpf_get_btf_vmlinux' [-Werror=implicit-function-declaration]
    8929 |   btf = bpf_get_btf_vmlinux();
         |         ^~~~~~~~~~~~~~~~~~~
   net/core/filter.c:8929:7: warning: assignment to 'struct btf *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    8929 |   btf = bpf_get_btf_vmlinux();
         |       ^
   cc1: some warnings being treated as errors


vim +/bpf_get_btf_vmlinux +8929 net/core/filter.c

  8909	
  8910	static bool tc_qdisc_is_valid_access(int off, int size,
  8911					     enum bpf_access_type type,
  8912					     const struct bpf_prog *prog,
  8913					     struct bpf_insn_access_aux *info)
  8914	{
  8915		struct btf *btf;
  8916	
  8917		if (off < 0 || off >= sizeof(struct bpf_qdisc_ctx))
  8918			return false;
  8919	
  8920		switch (off) {
  8921		case offsetof(struct bpf_qdisc_ctx, skb):
  8922			if (type == BPF_WRITE ||
  8923			    size != sizeof_field(struct bpf_qdisc_ctx, skb))
  8924				return false;
  8925	
  8926			if (prog->expected_attach_type != BPF_QDISC_ENQUEUE)
  8927				return false;
  8928	
> 8929			btf = bpf_get_btf_vmlinux();
  8930			if (IS_ERR_OR_NULL(btf))
  8931				return false;
  8932	
  8933			info->btf = btf;
  8934			info->btf_id = tc_qdisc_ctx_access_btf_ids[0];
  8935			info->reg_type = PTR_TO_BTF_ID | PTR_TRUSTED;
  8936			return true;
  8937		case bpf_ctx_range(struct bpf_qdisc_ctx, classid):
  8938			return size == sizeof_field(struct bpf_qdisc_ctx, classid);
  8939		case bpf_ctx_range(struct bpf_qdisc_ctx, expire):
  8940			return size == sizeof_field(struct bpf_qdisc_ctx, expire);
  8941		case bpf_ctx_range(struct bpf_qdisc_ctx, delta_ns):
  8942			return size == sizeof_field(struct bpf_qdisc_ctx, delta_ns);
  8943		default:
  8944			return false;
  8945		}
  8946	
  8947		return false;
  8948	}
  8949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
