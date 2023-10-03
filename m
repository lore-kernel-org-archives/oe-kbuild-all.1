Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B39022F10
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696336151; x=1727872151;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pc75A29Qr+v2GGHyvOoeOlvXcO2Uz5k6FAnU6RIw6NA=;
  b=RueYqCX1PdkeJflwumrtoz6FG6zJkIElN9yp99KlZ1TSDxiAGe6s/Ln6
   lEl7buvcaqlriSip4ha/nVgeBkISEs7+Jh0JahOamm66Ys3XpzXaJwSsu
   2Iwlnyx5ch87e44OH7IJyRL6JcM0nH2HUJjBS0S8y+k53xfbI2CJhignW
   fnt53B8yVWwODE+UUYbzAEqMUEc1dQZHLo0uus5SsW92ouepF7aNQBNHw
   IlOXtPoG0gZs9ue62LBJkPIocbnh0P+puE4VIMSQyqXHrMKjNabQ4keXz
   jU8ywWLH3lsxL2EL+NmwSB0jS5qQ+u80/Oz+DRjIBN/xAjZjCOD0Tnqb4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381741727"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="381741727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 05:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="750908596"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="750908596"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 03 Oct 2023 05:29:08 -0700
Message-ID: <164ea72d-9d73-5751-a67a-bcf40c351743@linux.intel.com>
Date: Tue, 3 Oct 2023 15:30:33 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v1 03/10] xhci: dbc: Use sysfs_emit() to instead of
 scnprintf()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kernel test robot <lkp@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231002161610.2648818-3-andriy.shevchenko@linux.intel.com>
 <202310030150.M1SfrYmG-lkp@intel.com> <ZRvVyN7A/AWoZLj5@smile.fi.intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZRvVyN7A/AWoZLj5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3.10.2023 11.50, Andy Shevchenko wrote:
> On Tue, Oct 03, 2023 at 02:03:53AM +0800, kernel test robot wrote:
> 
> 
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/usb/host/xhci-dbgcap.c: In function 'dbc_show':
>>>> drivers/usb/host/xhci-dbgcap.c:926:34: warning: unused variable 'p' [-Wunused-variable]
>>       926 |         const char              *p;
>>           |                                  ^
> 
> Indeed, forgot to remove it...
> 
> Mathias, tell me if you want a v2 of this patch or the entire series.
> 

No need, I can fix this while applying

Thanks
Mathias
