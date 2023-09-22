Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF775323E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 16:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695400383; x=1726936383;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=n2tpziZFCVuyN6rruA1ZmLCh2RYhKljPGvsKB6KiRu8=;
  b=REewOiKIZmlAYyCe09XMO+SfxNqISgdVqLRAzTM20OAhY5JGKF4CHc1O
   6xRyeMNS4WmreHjq8KZohYQv44LDFBzqM+oDVj8btKyyh/aB8TymBEgoy
   rVhkgGQOfB7g4SOySVIHFxABSVP/W0P/e1e17oAV748MGvwiEdkyYC1ID
   8X2Stv1uesIYH/Zos5iLYosF0Ua/QMN2x2qh044/ecd1ufkcNdCsRJhsG
   57Axdq1GeSEl/Ri39IfBB5EXOPsrM9WFfS5IusmcvvgGoM3h3f5W5m1vD
   TY525qZiYqZfIBE5WzUcDl1q5wEN/9e79NFg8N6BORfhYALZCscKEuB63
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379757034"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="379757034"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 09:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="890873689"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="890873689"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2023 09:32:06 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjj4q-0000zB-21;
	Fri, 22 Sep 2023 16:32:50 +0000
Date: Sat, 23 Sep 2023 00:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [-stable,6.1 01/17] netfilter: nf_tables: don't skip expired
 elements during walk
Message-ID: <ZQ3BUNNkLY2EPB1n@845c4ce01481>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922163029.150988-2-pablo@netfilter.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [-stable,6.1 01/17] netfilter: nf_tables: don't skip expired elements during walk
Link: https://lore.kernel.org/stable/20230922163029.150988-2-pablo%40netfilter.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



