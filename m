Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEE56473
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 19:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709924703; cv=none; b=U9AO8tfQZWVvfUhsnEATE1I+jfrNAEp8OEojco3MgSGDOjsaBPlu4SyGStCoYu7SUubHSg7FrrZYNZIKExFL7r8t2g3WozhBr43oOpgXRL2UTtVMDGYQnndpJqitC96eGTRbrQJV7Xk4iFVmARlEnyZfz/8ouDP0tHk2r0jUwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709924703; c=relaxed/simple;
	bh=KnUy64Ys1+HCcGfbdmmi2sOVxRwA+UinoaRCW53y/oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmQQvwsBzex/i7qorPHTOoahqx4k83XTdTk4K5/GJ2DZz1kpKKsLQ/AZiVVWOyw8jVh9D73AJ8BJqafHZ/0+7aL0W2vui6F5/PsBUpmRdgyJnDJ3fI6SqzN5HeUkR2IHfMvmoi+YtCEkT7pF+OVO9DmWfjXfg7erKncunj7slQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvnG7J3W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvnG7J3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709924701; x=1741460701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnUy64Ys1+HCcGfbdmmi2sOVxRwA+UinoaRCW53y/oQ=;
  b=jvnG7J3W+INkgG3EvUxCiw+pcS7bDhaWYBjxWP/Unr17jBme8NI54P93
   usUKI2OQmiB099bagsqUfshROgjySe5mxmYlCeGwVoNu3RuMisGYJQdlU
   jJI9vYinijnQAutB5J09zjZk/yFsF4jvZxbOMqPBcrH23rrZHXFHxNXSH
   HcCOmtNPUQIk5pBXB7qmhNUPCV+j+0F+JaKWoN6MyofZ3Hj91C43mcY9Q
   hqGf4rFSBlbS/xZ8mEC5i8UhexEFO2aXbbJfA6Ok7f6j+VdqgqS4yiRiV
   F928Ss6/9AXGoWRonFLoRKEEsrZtm70FwRYiJiCR4xSV2eq7KHFOV35VR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4786638"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4786638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 11:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10987403"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2024 11:04:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rifWb-0006cp-0R;
	Fri, 08 Mar 2024 19:04:57 +0000
Date: Sat, 9 Mar 2024 03:04:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 9/37]
 include/trace/events/fsverity.h:169:19: warning: format '%lu' expects
 argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202403090240.Tm2TfFoc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 6bcbc002b1f832b03eb57f87dcc64984efa975b5 [9/37] fsverity: add tracepoints
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090240.Tm2TfFoc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090240.Tm2TfFoc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090240.Tm2TfFoc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/fsverity.h:181,
                    from fs/verity/fsverity_private.h:165,
                    from fs/verity/init.c:9:
   include/trace/events/fsverity.h: In function 'trace_raw_output_fsverity_verify_signature':
>> include/trace/events/fsverity.h:169:19: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     169 |         TP_printk("ino %lu sig_size %lu %s%s%s",
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/fsverity.h:153:1: note: in expansion of macro 'TRACE_EVENT'
     153 | TRACE_EVENT(fsverity_verify_signature,
         | ^~~~~~~~~~~
   include/trace/events/fsverity.h:169:9: note: in expansion of macro 'TP_printk'
     169 |         TP_printk("ino %lu sig_size %lu %s%s%s",
         |         ^~~~~~~~~
   In file included from include/trace/trace_events.h:237:
   include/trace/events/fsverity.h:169:39: note: format string is defined here
     169 |         TP_printk("ino %lu sig_size %lu %s%s%s",
         |                                     ~~^
         |                                       |
         |                                       long unsigned int
         |                                     %u


vim +169 include/trace/events/fsverity.h

   152	
   153	TRACE_EVENT(fsverity_verify_signature,
   154		TP_PROTO(const struct inode *inode, const u8 *signature, size_t sig_size),
   155		TP_ARGS(inode, signature, sig_size),
   156		TP_STRUCT__entry(
   157			__field(ino_t, ino)
   158			__dynamic_array(u8, signature, sig_size)
   159			__field(size_t, sig_size)
   160			__field(size_t, sig_size_show)
   161		),
   162		TP_fast_assign(
   163			__entry->ino = inode->i_ino;
   164			memcpy(__get_dynamic_array(signature), signature, sig_size);
   165			__entry->sig_size = sig_size;
   166			__entry->sig_size_show = (sig_size > FSVERITY_HASH_SHOWN_LEN ?
   167				FSVERITY_HASH_SHOWN_LEN : sig_size);
   168		),
 > 169		TP_printk("ino %lu sig_size %lu %s%s%s",
   170			(unsigned long) __entry->ino,
   171			__entry->sig_size,
   172			(__entry->sig_size ? "sig " : ""),
   173			__print_hex(__get_dynamic_array(signature),
   174				__entry->sig_size_show),
   175			(__entry->sig_size ? "..." : ""))
   176	);
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
