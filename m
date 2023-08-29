Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48E17FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 15:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AA1C433C8;
	Tue, 29 Aug 2023 15:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693323070;
	bh=Mh+0y0yvc2IN0GEB+tS5u7wKkJo7kMHFUG22ug+/wpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAJihCfAHQ72atMlN8qu8/0P9QTeguvBD1yPx5jidJitAGxPWCDc0jdzM3cylztuz
	 4XR/x7wbQxP+7z8mUWLXsCGwGx4NLqgjhEy4Pp9q8I15klYet0CaOEpDclKfcGa1wD
	 HXxiFP0LaW0sxtQwM9pmKa1nRjyI4BnnOoAj6pChyOHbpBdhqT+TAtjpVCBZDrzloO
	 J5kLQGBE9DfzSoGMQ6rlbtsVsoTsfSmFvIPxbvFc3y9dUIXnXHHN4gCCGWVs6oyJ5A
	 lWTJ4wMlYV9L3PnFyUxqERFOJDabkttWl2R3jC+7UQRFD8b1xDXQc+3mX2JdbgNdSI
	 MWQWOWjKzEH4A==
Date: Wed, 30 Aug 2023 00:31:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [pci:controller/qcom-ep 3/3]
 drivers/pci/controller/dwc/pcie-qcom-ep.c:198: warning: Function parameter
 or member 'icc_mem' not described in 'qcom_pcie_ep'
Message-ID: <20230829153109.GA2138716@rocinante>
References: <202308292252.HNCCTM4u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308292252.HNCCTM4u-lkp@intel.com>

Hello,

[...]
> >> drivers/pci/controller/dwc/pcie-qcom-ep.c:198: warning: Function parameter or member 'icc_mem' not described in 'qcom_pcie_ep'

I took care of this on Krishna's behalf.

	Krzysztof
