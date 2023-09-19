Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA1347B2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695144425; x=1726680425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JYtHS6/pwErt9eMHkWOA4Rpq7zWdXU9JPzjptQ4Zl+o=;
  b=CqGK8dWAOhgh2OgngDq9n41xTB5vcvDHdbfJV3LaB5eV/MQ08ivVPhEb
   u7WrsbXxj0+Yq2zHtCvnBGFfl3RFNZXqSby2DN1MOBc8KO7PFxgn2kGee
   5P7ZBQZyEgup007AXN81Nu8d4CMeeCgr2KACrhLf8VqGZqJftMkfz6O1+
   5oYmRKFyPKls0q6aoBU0F/l6VTLyNhRjuNRMV7dZcBri1UkLrH7+r4EOJ
   dkpguz9Hz7pvt6qDTnEZC9OEoq78APCLN6hWZo7qoUm2hbfiHAr70TwgZ
   KZoPKLqH2vgAtMmuyzoNxjKiStnNkaPYEzuIFbNtqHYv55q9b21FFbZU7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410936042"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="410936042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 10:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746316071"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="746316071"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Sep 2023 10:27:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qieV0-0007jo-0c;
	Tue, 19 Sep 2023 17:26:58 +0000
Date: Wed, 20 Sep 2023 01:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Raymond <draymond@foxvalley.net>, linux-kernel@vger.kernel.org,
	x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1] arch/x86: port I/O tracing on x86
Message-ID: <202309200143.Me2RTikv-lkp@intel.com>
References: <14c27df7-12a3-e432-a741-17672185c092@foxvalley.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c27df7-12a3-e432-a741-17672185c092@foxvalley.net>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on be8b93b5cc7d533eb8c9b0590cdac055ecafe13a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Raymond/arch-x86-port-I-O-tracing-on-x86/20230919-015640
base:   be8b93b5cc7d533eb8c9b0590cdac055ecafe13a
patch link:    https://lore.kernel.org/r/14c27df7-12a3-e432-a741-17672185c092%40foxvalley.net
patch subject: [PATCH v1] arch/x86: port I/O tracing on x86
config: x86_64-buildonly-randconfig-001-20230919 (https://download.01.org/0day-ci/archive/20230920/202309200143.Me2RTikv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200143.Me2RTikv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200143.Me2RTikv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/trace_portio.c:6:6: warning: no previous prototype for 'do_trace_portio_read' [-Wmissing-prototypes]
       6 | void do_trace_portio_read(u32 value, u16 port, char width, long ip_addr)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/lib/trace_portio.c:13:6: warning: no previous prototype for 'do_trace_portio_write' [-Wmissing-prototypes]
      13 | void do_trace_portio_write(u32 value, u16 port, char width, long ip_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/do_trace_portio_read +6 arch/x86/lib/trace_portio.c

     5	
   > 6	void do_trace_portio_read(u32 value, u16 port, char width, long ip_addr)
     7	{
     8		trace_portio_read(value, port, width, ip_addr);
     9	}
    10	EXPORT_SYMBOL_GPL(do_trace_portio_read);
    11	EXPORT_TRACEPOINT_SYMBOL_GPL(portio_read);
    12	
  > 13	void do_trace_portio_write(u32 value, u16 port, char width, long ip_addr)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
