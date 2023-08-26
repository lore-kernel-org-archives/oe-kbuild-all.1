Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218CD2E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 15:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E4FC433C7;
	Sat, 26 Aug 2023 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693064336;
	bh=AhHOE+P4JxMBh24kPTGMBSIjODF9G+hVoKWd0iLMDb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5I/QpkZpUHIadlb9K4ekM1osqMox8ACZMZM8NdOhpFkhMHe8RD5OpWahZ7dlzYI4
	 YbRb8mpdXi2IklJDm46leDrznZcIEX4e4dyLeg1q8lp9zoCW3LFNLCqAnuYC2edZ0e
	 O0weZIK8cQAcQEutUMXWOACeqgbSnrXOXKLPo181m6sE3FKg2d8r8XaNrLFrse+Ep6
	 E5GxEwJuKsxnUq0mDBAAyGH4dj7z040ZjQTstDWdV6FL90FgcIlOm7ZTiy2xhHkuRi
	 KF2s2lvz7y4jaEqDISmAdOnq8nrzDDHo5SjK11i0ajDXy0SBf3yVP4hO/3IGCebWfo
	 RHLQKT7EuaZjw==
Date: Sun, 27 Aug 2023 00:38:54 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [pci:controller/qcom-edma 2/7] ERROR: modpost: "__umoddi3"
 [drivers/pci/endpoint/functions/pci-epf-mhi.ko] undefined!
Message-ID: <20230826153854.GB774351@rocinante>
References: <202308260652.rZm0oJCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308260652.rZm0oJCE-lkp@intel.com>

Hello,

[...]
> >> ERROR: modpost: "__umoddi3" [drivers/pci/endpoint/functions/pci-epf-mhi.ko] undefined!

I will take care of this on Manivannan's behalf.

	Krzysztof
