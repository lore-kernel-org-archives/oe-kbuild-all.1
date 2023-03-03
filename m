Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A411FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 10:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9861DC4339B;
	Fri,  3 Mar 2023 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677839159;
	bh=ap6IaIV9D5nbOojtI+wfT0yA2bCAiSAIWdekaC6UGUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foVECDwG0PPijbl6JhyvCndOgjOmexe75NDCt+P+tjQGrUX/oLVz/NQnIUcDjx0IZ
	 Zp6n3HNxVT/VfsPyH/bh2ghJlnUnfZTnxzf9+5ofGVRG40LOr040QILBZT9FtdJmR1
	 wo/OSFq8F9yflVGd21oESs2pIxW4bm+WM+6zV7Pgd/rEvRvf7cw/VfNXmze9TeXK14
	 69ZrA6pdUBXAQfr8aPgV7AoVUbFDOfZ1U6aHvUj/McX1rmMkRdWn4DYzqPgFqp4wGA
	 dUgfbecevGvLgU4rJwdPKw3ry8oDmm4sVlkZ04oLKtiR5P4XiY41yJnsT/c7Jp4mHg
	 pBma+VAN6UC+g==
Date: Fri, 3 Mar 2023 10:25:55 +0000
From: Lee Jones <lee@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Daniel Thompson <daniel.thompson@linaro.org>,
	linux-doc@vger.kernel.org
Subject: Re: htmldocs: Warning: MAINTAINERS references a file that doesn't
 exist: Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
Message-ID: <20230303102555.GO2303077@google.com>
References: <202302150624.hBap1fiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202302150624.hBap1fiY-lkp@intel.com>

On Wed, 15 Feb 2023, kernel test robot wrote:

> tree:   https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/backlight-ktz8866-Convert-to-i2c-s-probe_new/20230128-142032
> head:   dc37b5d324751a941e8c1241d6043bafef5b10cd
> commit: 65759c2135f640ed6d9ef64b96666e2980b4d122 backlight: ktz8866: Add support for Kinetic KTZ8866 backlight
> date:   3 weeks ago
> reproduce:
>         # https://github.com/intel-lab-lkp/linux/commit/65759c2135f640ed6d9ef64b96666e2980b4d122
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Uwe-Kleine-K-nig/backlight-ktz8866-Convert-to-i2c-s-probe_new/20230128-142032
>         git checkout 65759c2135f640ed6d9ef64b96666e2980b4d122
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302150624.hBap1fiY-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

What's going on here?  What tree is this?

Why does it contain:

  backlight: ktz8866: Add support for Kinetic KTZ8866 backlight

But not:

  dt-bindings: leds: backlight: Add Kinetic KTZ8866 backlight

-- 
Lee Jones [李琼斯]
