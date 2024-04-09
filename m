Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D26513A3F8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712693585; cv=none; b=Ef6G5wJ6+8HehJ6Ckxaatnw/N1Erzwge89t84Hr/6pv3yPicv9hX7+B0wghxRXEm+RCmr74DtlBY6um0IWH4RGOMIfMvwCGLjxxb2z2gbreIV0yl+SFhz1aASB2bMDFAtrK6hN23ozPq6z/Tc2qx+9hB/KPNrdJYr/snIt0BV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712693585; c=relaxed/simple;
	bh=UZFFHnNc0X9eBJtpzWXuMukwUqhnrwGdNKhUG276Wkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKwkdCh/mqhlIeGerE0NpAUIA/2+XD2EG9+U/GHcO7XWgW1o+gZJEozCRT+AFtSyMfbifQpGixlVdk4VoR5yydlU1lNTrHE5HHgBmH3uoQSphmzps+ZO5OBSmXr3xEJU5UFmco4O5VTsCXufgfpNIQwi32ixw2UT5TDYTyFkda8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnsZB7xp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnsZB7xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712693583; x=1744229583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZFFHnNc0X9eBJtpzWXuMukwUqhnrwGdNKhUG276Wkg=;
  b=KnsZB7xpE76RtM7CXyMfI/KeZa/ZKNIiRULRpkjbznB9xnB/88T0VQUZ
   LXk7z94a5uNLCh03qyBHAKPF+A0MZB9ijQKax7rcUuwf+ucafvxxi9J0Z
   Vj4qT5Jn/lL7bYP0KupUkPffpnfwxLbBsdc7fPq5gubrif2m+km5fM3C1
   eOrKzIgXwme1lvMRMqkpFyOkXOlGXnhEj9mrwrIHa34cew9qiSp3NeFmF
   3yOSnWiIu2ssPtoe2Hrvza3vomaggs/kRaypxT58PEop0GO725VBjHSOp
   VftA78AMiqnobr8aiA0TcRqHSdic0H0gmRt/qzBS03szwH24YvOLSlToU
   g==;
X-CSE-ConnectionGUID: 1YRN/KjbR+C/rcxIF6Lzcw==
X-CSE-MsgGUID: 7RFPfITjTPK/yfHfK4f/Xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18746845"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18746845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 13:13:02 -0700
X-CSE-ConnectionGUID: uvKtjR5PToGIxz3e8wpjBg==
X-CSE-MsgGUID: lr/Ny6KRTR+s3GqyiAqpMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51312344"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 13:13:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruHpz-0006TS-0H;
	Tue, 09 Apr 2024 20:12:59 +0000
Date: Wed, 10 Apr 2024 04:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v20 2/5] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202404100309.am1Aq6wU-lkp@intel.com>
References: <20240406173649.3210836-3-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406173649.3210836-3-vdonnefort@google.com>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7604256cecef34a82333d9f78262d3180f4eb525]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-allocate-sub-buffers-with-__GFP_COMP/20240407-013951
base:   7604256cecef34a82333d9f78262d3180f4eb525
patch link:    https://lore.kernel.org/r/20240406173649.3210836-3-vdonnefort%40google.com
patch subject: [PATCH v20 2/5] ring-buffer: Introducing ring-buffer mapping functions
config: riscv-randconfig-r122-20240409 (https://download.01.org/0day-ci/archive/20240410/202404100309.am1Aq6wU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240410/202404100309.am1Aq6wU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100309.am1Aq6wU-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/trace/ring_buffer.o: in function `rb_update_meta_page':
>> kernel/trace/ring_buffer.c:5227:(.text+0x1cce): undefined reference to `vm_insert_pages'


vim +5227 kernel/trace/ring_buffer.c

  5221	
  5222	static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
  5223	{
  5224		struct trace_buffer_meta *meta = cpu_buffer->meta_page;
  5225	
  5226		meta->reader.read = cpu_buffer->reader_page->read;
> 5227		meta->reader.id = cpu_buffer->reader_page->id;
  5228		meta->reader.lost_events = cpu_buffer->lost_events;
  5229	
  5230		meta->entries = local_read(&cpu_buffer->entries);
  5231		meta->overrun = local_read(&cpu_buffer->overrun);
  5232		meta->read = cpu_buffer->read;
  5233	
  5234		/* Some archs do not have data cache coherency between kernel and user-space */
  5235		flush_dcache_folio(virt_to_folio(cpu_buffer->meta_page));
  5236	}
  5237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
