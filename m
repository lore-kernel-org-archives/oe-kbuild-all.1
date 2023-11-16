Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1BCA6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JmVtHROU"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AGJhWLR120043;
	Thu, 16 Nov 2023 13:43:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700163812;
	bh=9sta8mi7bEhuPElDFVuC9XbaP1mtkSeBYHeQjiaOObQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JmVtHROU7+Qip0+d9GmGLl9qrMF+lH2PadlkUL0/7D8bqb7dSqSQ7D2iVE9zilHUB
	 5cxHLRI64rCZpK1Gdx8mBbeBXvmc3fujSkioQuCPiQtfKi7Hm1fPpRxnjOVr/zp0i8
	 tQdWApzMMNXb/yLS2/yxO+FAjpXNJAkHkS+RqNBM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AGJhWDo027995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Nov 2023 13:43:32 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Nov 2023 13:43:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Nov 2023 13:43:32 -0600
Received: from [10.250.34.132] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AGJhVfE041647;
	Thu, 16 Nov 2023 13:43:31 -0600
Message-ID: <e2c8075a-1e77-43c9-9709-174049f59cfb@ti.com>
Date: Thu, 16 Nov 2023 13:43:31 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Convert keystone-gate.txt to
 YAML
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231114212911.429951-2-afd@ti.com>
 <202311161400.qg1QNgEh-lkp@intel.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <202311161400.qg1QNgEh-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 11/16/23 12:35 AM, kernel test robot wrote:
> Hi Andrew,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on vkoul-dmaengine/next broonie-spi/for-next clk/clk-next linus/master v6.7-rc1 next-20231116]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/dt-bindings-clock-Convert-keystone-gate-txt-to-YAML/20231115-053346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20231114212911.429951-2-afd%40ti.com
> patch subject: [PATCH v2 2/4] dt-bindings: clock: Convert keystone-gate.txt to YAML
> reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161400.qg1QNgEh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311161400.qg1QNgEh-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
> 

Planning to convert bindings/remoteproc/ti,keystone-rproc.txt,
will update this link then if that is okay.

Andrew
