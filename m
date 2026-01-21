Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF363DA7C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768974045; cv=none; b=De90lEFhzb9ilBelE+Dji11reDwgniecxZVU3WeZZ/sTY1sKwtdHWGN+dwejYQSNsyEtDQc1pCFOKk95o3XkS7Fmas88NJLuhgoCANRyZUDbMMSifWfCldG+mWBmpRavf/v21b+ww0Hp5hRv+3u0WcdnzTgrx48g59djBphtf+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768974045; c=relaxed/simple;
	bh=Zx+SBvi0ayiSjILiYD+XZDq1nslSNFB+Y/17FI4keB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG0h6q5rJr2eFEDgPa0gtfsnE0OTMC5XhZcZKbQocRNs3+YKhIcE6VDhQe1A5hxZ8zRP8JEz7hprN+ZwtBV1sYkBiz4kL98qvyW9gLCxqQHKsmvXXfOZYtBekCEwdeJnDcsdvNw0iGyaKxeuPdeJGcF1Ps7HWd8AnC0uzomwRqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTyS0fv/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTyS0fv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768974040; x=1800510040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zx+SBvi0ayiSjILiYD+XZDq1nslSNFB+Y/17FI4keB4=;
  b=FTyS0fv/S6JZ+fOMwFJwYNC4BQ5MajixK0eCSnrDME30F6cN4P+5Wsdm
   /HBzO6zN0Ho5oUEdbtmmHx4X1cmZoa6HFYfyMLDxr09o9FXjRQHF/Qs7e
   VlNGedrDH9wmi8OEIZEQg9YHhMjAhkT1yJ7DARnYx+m7wkXg6Qpb/FdzI
   KQt0iX7C8JJPJpQ4R4TtS78N5990rCWVKboWvHt90gjVf+8A9cJDlpLn0
   Cg6ISnoNLQ1lguz1WPUvhSuD9sZ8V83GPw3XeLSTsfAWbI2EVqbruVyGN
   a7kF9WP7OnfNmj9zKu9dsuXoh73CBu7RQO96LaOcQr72nO0QXYKZR/03I
   w==;
X-CSE-ConnectionGUID: TiMnKJitSYCjg/tTN+eJPg==
X-CSE-MsgGUID: yt6JTrwrRPCPv3rmmIElSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87608248"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="87608248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 21:40:40 -0800
X-CSE-ConnectionGUID: yIdPUrdgSiybgm4rI91ngg==
X-CSE-MsgGUID: HUtRvEKGQIavCBzlQuTQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210796208"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2026 21:40:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viQxD-00000000Q27-2Z5X;
	Wed, 21 Jan 2026 05:40:31 +0000
Date: Wed, 21 Jan 2026 13:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	pmladek@suse.com, john.ogness@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, asantostc@gmail.com, efault@gmx.de,
	gustavold@gmail.com, calvin@wbinvd.org, jv@jvosburgh.net,
	mpdesouza@suse.com, kernel-team@meta.com
Subject: Re: [PATCH net-next v2 4/5] netconsole: Use printk context for CPU
 and task information
Message-ID: <202601211304.r9ecHy9L-lkp@intel.com>
References: <20260120-nbcon-v2-4-b61f960587a8@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-nbcon-v2-4-b61f960587a8@debian.org>

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on 956f569c90ab507559342d289f4c923adfbf06f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/printk-Add-execution-context-task-name-CPU-to-printk_info/20260121-033457
base:   956f569c90ab507559342d289f4c923adfbf06f5
patch link:    https://lore.kernel.org/r/20260120-nbcon-v2-4-b61f960587a8%40debian.org
patch subject: [PATCH net-next v2 4/5] netconsole: Use printk context for CPU and task information
config: csky-randconfig-r134-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211304.r9ecHy9L-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211304.r9ecHy9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211304.r9ecHy9L-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/netconsole.c: In function 'sysdata_append_cpu_nr':
>> drivers/net/netconsole.c:1365:31: error: 'struct nbcon_write_context' has no member named 'cpu'
    1365 |                          wctxt->cpu);
         |                               ^~
   drivers/net/netconsole.c: In function 'sysdata_append_taskname':
>> drivers/net/netconsole.c:1373:31: error: 'struct nbcon_write_context' has no member named 'comm'
    1373 |                          wctxt->comm);
         |                               ^~
   drivers/net/netconsole.c: In function 'sysdata_append_cpu_nr':
>> drivers/net/netconsole.c:1366:1: warning: control reaches end of non-void function [-Wreturn-type]
    1366 | }
         | ^
   drivers/net/netconsole.c: In function 'sysdata_append_taskname':
   drivers/net/netconsole.c:1374:1: warning: control reaches end of non-void function [-Wreturn-type]
    1374 | }
         | ^


vim +1365 drivers/net/netconsole.c

  1359	
  1360	static int sysdata_append_cpu_nr(struct netconsole_target *nt, int offset,
  1361					 struct nbcon_write_context *wctxt)
  1362	{
  1363		return scnprintf(&nt->sysdata[offset],
  1364				 MAX_EXTRADATA_ENTRY_LEN, " cpu=%u\n",
> 1365				 wctxt->cpu);
> 1366	}
  1367	
  1368	static int sysdata_append_taskname(struct netconsole_target *nt, int offset,
  1369					   struct nbcon_write_context *wctxt)
  1370	{
  1371		return scnprintf(&nt->sysdata[offset],
  1372				 MAX_EXTRADATA_ENTRY_LEN, " taskname=%s\n",
> 1373				 wctxt->comm);
  1374	}
  1375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
