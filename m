Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BB6132
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682179759; x=1713715759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UxZNNg2iR21QuxXZOviYjeKG5ki4ex9gVhzKOBg6N/A=;
  b=Dm6KgQBJUaM4PjgWvsQDA001j9KpDZhGZjzRNmm0zv1qdzmih0BqUt/b
   XLMw4AJ0OjmUqq/YAvLumxNSG58YmYR85Co1Mu2pkJ3YU0GfTy5709vJB
   zq6SxGlKamkFBOaNQUrFwzs+hi1Nofhj7FuOuJLPPtSJkxFeE8k8jeQua
   qzh7gkO+irXITdhtPavut+9NWJ46RFoES/Gw/aNzPy7lLDRMTyCIES4Ds
   iLao/GfncVqIgSCMZsQgmA8nXabpShzZcqovyNHNYD2kw1fdLvNlDuOyT
   5efAw0N2weYWWIs/NjHjy77WMk9QpEk3ACv9ajVpdDCxf+C9ATNWg0hQa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325771758"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="325771758"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 09:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="692580814"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="692580814"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 22 Apr 2023 09:09:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pqFnU-003fcv-2G;
	Sat, 22 Apr 2023 19:09:12 +0300
Date: Sat, 22 Apr 2023 19:09:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Mehdi Djait <mehdi.djait.k@gmail.com>, jic23@kernel.org,
	mazziesaccount@gmail.com, oe-kbuild-all@lists.linux.dev,
	krzysztof.kozlowski+dt@linaro.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iio: accel: Add support for Kionix/ROHM
 KX132-1211 accelerometer
Message-ID: <ZEQGqFLIyxm5XENQ@smile.fi.intel.com>
References: <cef09595632a40eff8a0864fea2e0eb6653930a5.1682019544.git.mehdi.djait.k@gmail.com>
 <202304220729.FCofPRvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202304220729.FCofPRvH-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 22, 2023 at 07:19:44AM +0800, kernel test robot wrote:
> Hi Mehdi,
> 
> kernel test robot noticed the following build warnings:

I believe it's not just a warning, it's a full functional error in the code.

>    686	{
>    687		struct device *dev = regmap_get_device(data->regmap);
>    688		__le16 buf_status;
>    689		int ret, fifo_bytes;
>    690	
>    691		ret = regmap_bulk_read(data->regmap, data->chip_info->buf_status1,
>    692				       &buf_status, sizeof(buf_status));
>    693		if (ret) {
>    694			dev_err(dev, "Error reading buffer status\n");
>    695			return ret;
>    696		}
>    697	
>  > 698		buf_status &= data->chip_info->buf_smp_lvl_mask;
>    699		fifo_bytes = le16_to_cpu(buf_status);

You need to mask in the same endianess space, i.o.w. either on CPU or device side.

I believe you wanted to have fifo_bytes to be masked, but I'm not sure.

>    701		return fifo_bytes;
>    702	}

-- 
With Best Regards,
Andy Shevchenko


