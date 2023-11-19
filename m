Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EDA35
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 02:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts7At98R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700359733; x=1731895733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iL57WeLHJ6iHCTgU+X14uMPm3VyxY0+gO4K+uTWc0tA=;
  b=Ts7At98R/j8qmr5QKkX7bVJz7ylOYjIcciHF4+tW+GDxe0zW23Gmhkb5
   SmGQxbXkYVd29vPVirjtz1PQbTG/6lI8hYQ/bcL60TB+ftma/xYN/iukG
   p/uKSGDBRrHQoHVQVdiySyniaRHZ27dkeL8N9VrPVHCv9gKxB5BBFP3nd
   1lWMnANRIOdOZg+BGkUkmaOnSanGKbPPya8Va+z3bmK8PjYIfGI08sWPR
   lEdxFdUkeOMPntHduKECJcqY53vfISMbNFA9gaxSajBkWhmugTqIk7ihS
   +mhAuiiZBOWd0xwkIbRf9RjCALZOAkmMDuiqMfzPf7q74e3pyAYo3fx+y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="381855777"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="381855777"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 18:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="883506687"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="883506687"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2023 18:08:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4XEt-0004X3-27;
	Sun, 19 Nov 2023 02:08:47 +0000
Date: Sun, 19 Nov 2023 10:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Anshul Dalal <anshulusr@gmail.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] iio: dac: driver for MCP4821
Message-ID: <202311190944.LgtvolpG-lkp@intel.com>
References: <20231117073040.685860-2-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117073040.685860-2-anshulusr@gmail.com>

Hi Anshul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/iio-dac-driver-for-MCP4821/20231117-153451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231117073040.685860-2-anshulusr%40gmail.com
patch subject: [PATCH 2/2] iio: dac: driver for MCP4821
config: i386-randconfig-061-20231119 (https://download.01.org/0day-ci/archive/20231119/202311190944.LgtvolpG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311190944.LgtvolpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190944.LgtvolpG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/dac/mcp4821.c:120:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] write_val @@     got unsigned long @@
   drivers/iio/dac/mcp4821.c:120:27: sparse:     expected restricted __be16 [usertype] write_val
   drivers/iio/dac/mcp4821.c:120:27: sparse:     got unsigned long
>> drivers/iio/dac/mcp4821.c:122:35: sparse: sparse: invalid assignment: |=
>> drivers/iio/dac/mcp4821.c:122:35: sparse:    left side has type restricted __be16
>> drivers/iio/dac/mcp4821.c:122:35: sparse:    right side has type unsigned long
>> drivers/iio/dac/mcp4821.c:123:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __be16 [usertype] write_val @@
   drivers/iio/dac/mcp4821.c:123:36: sparse:     expected unsigned short [usertype] val
   drivers/iio/dac/mcp4821.c:123:36: sparse:     got restricted __be16 [usertype] write_val
   drivers/iio/dac/mcp4821.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +120 drivers/iio/dac/mcp4821.c

   106	
   107	static int mcp4821_write_raw(struct iio_dev *indio_dev,
   108				     struct iio_chan_spec const *chan, int val,
   109				     int val2, long mask)
   110	{
   111		struct mcp4821_state *state;
   112		__be16 write_val;
   113		u8 write_buffer[2];
   114		int ret;
   115		bool is_value_valid = val >= 0 && val < BIT(chan->scan_type.realbits) &&
   116				      val2 == 0;
   117		if (mask == IIO_CHAN_INFO_RAW && is_value_valid) {
   118			state = iio_priv(indio_dev);
   119	
 > 120			write_val = MCP4821_ACTIVE_MODE | val << chan->scan_type.shift;
   121			if (chan->channel)
 > 122				write_val |= MCP4802_SECOND_CHAN;
 > 123			put_unaligned_be16(write_val, write_buffer);
   124			ret = spi_write(state->spi, write_buffer, sizeof(write_buffer));
   125			if (ret) {
   126				dev_err(&state->spi->dev,
   127					"Failed to write to device: %d", ret);
   128				return ret;
   129			}
   130	
   131			mutex_lock(&state->lock);
   132			state->dac_value[chan->channel] = val;
   133			mutex_unlock(&state->lock);
   134			return 0;
   135		} else {
   136			return -EINVAL;
   137		}
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
