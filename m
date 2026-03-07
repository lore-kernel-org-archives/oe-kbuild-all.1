Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8342015A864
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 00:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772842759; cv=none; b=AU6oKr4fkkfhewtkXpwK3GAD7pngQok44SmBvzdJx/ubZcCJ140fftcEr6xq6jSXm5/gRfJGeHvECqMRM3jA9gazNxejCLZFGf5OzlWlhTJ5zs7Zi4ZwMlctoUrwWrYXG2HEQ4+sKMZie6Eav4c6ujFMsI9niYfJrOcJCjdpGTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772842759; c=relaxed/simple;
	bh=Ilh7TK+Z36qOWbWKbKSpkvaRbc5z/61up1FN4cWDssw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f1oLbHe9o4iTL3hKQsbfu74ygbHXSFw86yOp02NwfWajX8rNrv94mNZ0mXLuvuXJTrpg2UqYH9ECTbcpYq+u49e+wGg3K0P4XEIOHd8iYo6CRwx7hBY+6GN333eUX91ZLll0wvpv0HyJCzkQCs3uNBMNpIs0Z5j3h+1uUkZqZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCSLpbXj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCSLpbXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772842756; x=1804378756;
  h=date:from:to:cc:subject:message-id;
  bh=Ilh7TK+Z36qOWbWKbKSpkvaRbc5z/61up1FN4cWDssw=;
  b=HCSLpbXjKe6BqxyS/dASUX75b+mgPHSOWOuIVZhnygDN8BQ5ui9JeFPz
   2rb/kGU+dFd0NlFCZoGFDOfd7owxogYy2izLUXDHMPj9ubyhSz6+MCTIm
   Vz7f1+iW/T+QRqLT2SOdxLF7AYPurRjbwTgDdsgYYo1+DzPtNbp1fXl9t
   EgGQEsNB+/zK82PR6aUa23WanU6PnWqk1cI06ve5Et6doK0zYMiyZCfew
   zPobPnuShBKaCBI9CftHgUB9mOOki81xCImvgj1whLj2SliGbPnj2cGRp
   Vpx2lrldQegsBjIcZ7QvEMNxMJ0Op3RL6wjR7sWxJfhvfiFtzu47t+onR
   w==;
X-CSE-ConnectionGUID: 7F+mVaM4TDqQ5WpdaekxKA==
X-CSE-MsgGUID: CgvbJ1waTNGuFjp2ZTpZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="96572764"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="96572764"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 16:19:16 -0800
X-CSE-ConnectionGUID: kxZOCDwuTFmyLVuq5S3svw==
X-CSE-MsgGUID: Zj62sDbuRoCC/DBIZ3QS3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219146302"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2026 16:19:15 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyfNw-000000001VR-1WlZ;
	Sat, 07 Mar 2026 00:19:12 +0000
Date: Sat, 07 Mar 2026 08:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 10/26]
 kernel/bpf/trampoline.c:1523:15: error: implicit declaration of function
 'btf_distill_func_proto'; did you mean 'bpf_base_func_proto'?
Message-ID: <202603070823.JfRgS5ds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   c803155263f86db2a723f3009d3dbe9f647db78f
commit: 891ffb6190b8505a9a05808802307c25b768b998 [10/26] bpf: Add bpf_trampoline_multi_attach/detach functions
config: x86_64-randconfig-076-20260307 (https://download.01.org/0day-ci/archive/20260307/202603070823.JfRgS5ds-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070823.JfRgS5ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070823.JfRgS5ds-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c: In function 'bpf_get_btf_id_target':
>> kernel/bpf/trampoline.c:1523:15: error: implicit declaration of function 'btf_distill_func_proto'; did you mean 'bpf_base_func_proto'? [-Wimplicit-function-declaration]
    1523 |         err = btf_distill_func_proto(NULL, btf, t, tname, &tgt_info->fmodel);
         |               ^~~~~~~~~~~~~~~~~~~~~~
         |               bpf_base_func_proto


vim +1523 kernel/bpf/trampoline.c

  1501	
  1502	static int bpf_get_btf_id_target(struct btf *btf, struct bpf_prog *prog, u32 btf_id,
  1503					 struct bpf_attach_target_info *tgt_info)
  1504	{
  1505		const struct btf_type *t;
  1506		unsigned long addr;
  1507		const char *tname;
  1508		int err;
  1509	
  1510		if (!btf_id || !btf)
  1511			return -EINVAL;
  1512		t = btf_type_by_id(btf, btf_id);
  1513		if (!t)
  1514			return -EINVAL;
  1515		tname = btf_name_by_offset(btf, t->name_off);
  1516		if (!tname)
  1517			return -EINVAL;
  1518		if (!btf_type_is_func(t))
  1519			return -EINVAL;
  1520		t = btf_type_by_id(btf, t->type);
  1521		if (!btf_type_is_func_proto(t))
  1522			return -EINVAL;
> 1523		err = btf_distill_func_proto(NULL, btf, t, tname, &tgt_info->fmodel);
  1524		if (err < 0)
  1525			return err;
  1526		if (btf_is_module(btf)) {
  1527			/* The bpf program already holds refference to module. */
  1528			if (WARN_ON_ONCE(!prog->aux->mod))
  1529				return -EINVAL;
  1530			addr = find_kallsyms_symbol_value(prog->aux->mod, tname);
  1531		} else {
  1532			addr = kallsyms_lookup_name(tname);
  1533		}
  1534		if (!addr || !ftrace_location(addr))
  1535			return -ENOENT;
  1536		tgt_info->tgt_addr = addr;
  1537		return 0;
  1538	}
  1539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
