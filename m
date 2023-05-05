Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501775383
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683297528; x=1714833528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PUgpExWS/DnhiAjBBBKEofIsIASJDAnwJ4/ps5m0Kg0=;
  b=elI1z+1gPdGtAFQ0UF1JIEpB2mGtmLvDGjk7o11LCEWPRawzvBh+U5vF
   XT0sAw4jtQB0pt7/8xGuu3rPdtSNZzfSQJC7GOwGm3IRBju5NX5ozdLkv
   5UbzuVxrjZp5rJ9GJJZHHW0keOs8scldAYStsDXfv40lyJa0b5gBFV6Rl
   4jXxRnFHvKMCeqhS9gQ+jtcvlLFUEVcQpGOCq91jj9Cc0I0HuMSRKsFgB
   JiueNUjeEEbQBYLqXa3eVcwrIOL6+Y3Uj4veZFu1X8VdjvB4o8N7dTpEI
   F5XnKO1w4/lFmFyf7dVMSUN3h6baVHPFNB4efTZnLThgz8ShYYzX+AWrV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349256430"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="349256430"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 07:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="1027518594"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="1027518594"
Received: from annguyen-mobl2.amr.corp.intel.com (HELO [10.209.140.100]) ([10.209.140.100])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 07:38:39 -0700
Message-ID: <a7e4998b-23b0-0018-57e7-7f6faa12e6db@intel.com>
Date: Fri, 5 May 2023 07:38:37 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [tip:master 4/4] htmldocs: Warning: arch/x86/Kconfig references a
 file that doesn't exist: Documentation/x86/shstk.rst
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@kernel.org>
References: <202305050705.5V1x1V3i-lkp@intel.com>
 <aa2efa2f-70ea-09b4-f21b-8e69f18fad1e@infradead.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <aa2efa2f-70ea-09b4-f21b-8e69f18fad1e@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/23 17:17, Randy Dunlap wrote:
> which has been moved to Documentation/arch/x86/shstk.rst.

There's currently a pull request for this x86/shstk branch in Linus's
inbox.  If he pulls it, we'll send along a fix on top.  If not, we'll
fix it up before the next merge window.  No biggie.
