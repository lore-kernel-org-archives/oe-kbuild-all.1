Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8031CBEAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093760; cv=none; b=V0YL3mxN82EYRt58V8VSjMjqH6BoYWz+A3UmDmyrY085Tiwv4PIsmCosHJW/K1vZhVCn95eqc+e3k3aB8TD46Fl1QxQj62MDuxzwapAABifItLWGYbX7sLWyR7ZKXr+5EBsCEe6iQhS4seZG8y/j5PUAO0hoDZrY1+F6b8CDKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093760; c=relaxed/simple;
	bh=2hJSSDjXFAtycKzGHNXMUfkoGs9eSHIsgvQX1xkelMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUguK8fCbQSgymVaxFP5o6+D9a1ddX4q+4KedcsIJyO2cjRP2+vIdmeS5G+2vpU6oWjlbYBY67TYFYOQUQw0ouf7UQB7AUqEBtpxRQ7y3YM6P4bFFcFDlAN3wNrRg1ARQzP1hLI1E7ln9RSjNWKumIPiQFfy+tRzcUgQajlj/dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJAkcmwf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJAkcmwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761093758; x=1792629758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2hJSSDjXFAtycKzGHNXMUfkoGs9eSHIsgvQX1xkelMQ=;
  b=HJAkcmwf/6sXz84BPYG0cs7UTzPdqjEN/ekIKp5N1sr4oHPCFl2IxFJA
   qR8hY0fYw/onw3pNjnrSrq5M5vGOl2gwpwquUH+O0USYSGVO9+0kSRNrw
   Znwkeru/UKqXQwF1+gzo12Gwx8eh5+/pqlycP/rTL3XBA0p2EL8XePLhb
   eUZvaQ+HBkicqIS7Mg/WVvmHqcsoTnb/mo7OJafOQaT6s6zXtezHezoit
   Y9iIeUIBJTyKLepEfv0THzEkF7RO3R/ModR8lLs400KkMXKeDjLaq9hG2
   TnpK+VmvZA0fzUoj9cxsRaAyn+G8iUX3r2qsFSFdjtYRuUvJm1Gb48w8s
   w==;
X-CSE-ConnectionGUID: iyN0LTINQiiZwjXxHJmUqA==
X-CSE-MsgGUID: KTVAbIbHSsus93IRWiK5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63270523"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63270523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:42:38 -0700
X-CSE-ConnectionGUID: BvgKpkZQScmdObRcScbiFQ==
X-CSE-MsgGUID: QTz4Q1PfQ2yOrslB8fd+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183302643"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2025 17:42:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMvj-000Brp-2l;
	Wed, 22 Oct 2025 00:42:22 +0000
Date: Wed, 22 Oct 2025 08:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] dma-buf: improve dma_buf_show_fdinfo output
Message-ID: <202510220802.svbgdYsJ-lkp@intel.com>
References: <20251021133132.29751-1-biancaa2210329@ssn.edu.in>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021133132.29751-1-biancaa2210329@ssn.edu.in>

Hi Biancaa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biancaa-Ramesh/dma-buf-improve-dma_buf_show_fdinfo-output/20251021-213541
base:   linus/master
patch link:    https://lore.kernel.org/r/20251021133132.29751-1-biancaa2210329%40ssn.edu.in
patch subject: [PATCH] dma-buf: improve dma_buf_show_fdinfo output
config: x86_64-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220802.svbgdYsJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220802.svbgdYsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220802.svbgdYsJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c: In function 'dma_buf_show_fdinfo':
>> drivers/dma-buf/dma-buf.c:581:30: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'unsigned int' [-Wformat=]
     581 |     seq_printf(s, "flags:\t%lu\n", f->f_flags);
         |                            ~~^     ~~~~~~~~~~
         |                              |      |
         |                              |      unsigned int
         |                              long unsigned int
         |                            %u
>> drivers/dma-buf/dma-buf.c:582:30: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     582 |     seq_printf(s, "size:\t%llu\n", dmabuf->size);
         |                           ~~~^     ~~~~~~~~~~~~
         |                              |           |
         |                              |           size_t {aka long unsigned int}
         |                              long long unsigned int
         |                           %lu
   drivers/dma-buf/dma-buf.c:584:62: error: 'struct dma_buf' has no member named 'num_attachments'; did you mean 'attachments'?
     584 |     seq_printf(s, "attachments:\t%d\n", atomic_read(&dmabuf->num_attachments));
         |                                                              ^~~~~~~~~~~~~~~
         |                                                              attachments
   drivers/dma-buf/dma-buf.c:585:57: error: 'struct dma_buf' has no member named 'num_mappings'
     585 |     seq_printf(s, "mappings:\t%d\n", atomic_read(&dmabuf->num_mappings));
         |                                                         ^~


vim +581 drivers/dma-buf/dma-buf.c

   573	
   574	static void dma_buf_show_fdinfo(struct seq_file *s, struct file *f)
   575	{
   576	    struct dma_buf *dmabuf = f->private_data;
   577	
   578	    if (!dmabuf)
   579	        return;
   580	
 > 581	    seq_printf(s, "flags:\t%lu\n", f->f_flags);
 > 582	    seq_printf(s, "size:\t%llu\n", dmabuf->size);
   583	    seq_printf(s, "count:\t%ld\n", file_count(dmabuf->file) - 1);
   584	    seq_printf(s, "attachments:\t%d\n", atomic_read(&dmabuf->num_attachments));
   585	    seq_printf(s, "mappings:\t%d\n", atomic_read(&dmabuf->num_mappings));
   586	    seq_printf(s, "exp_name:\t%s\n", dmabuf->exp_name ? dmabuf->exp_name : "N/A");
   587	
   588	    spin_lock(&dmabuf->name_lock);
   589	    if (dmabuf->name)
   590	        seq_printf(s, "name:\t%s\n", dmabuf->name);
   591	    spin_unlock(&dmabuf->name_lock);
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
