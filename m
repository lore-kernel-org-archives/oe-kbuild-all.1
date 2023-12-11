Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C0D4E601;
	Mon, 11 Dec 2023 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5NK4jux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A403C433CB;
	Mon, 11 Dec 2023 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316344;
	bh=xyp12anGX6A6woeL2CoQILkv9VWnJfCr51svu2OIDw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5NK4juxFX2g1XVjNy3ebQdc6Re2uNrfTOKOXx1XLlgsaI0LvRIj/BAJYkqoECjlD
	 4MANf1874/VlyKlCPATvHp4Dibw8/eSZ/RAsh2r2AE7fs31WmhN/OWFW8IXE/kMOQ8
	 NmvTH5EVEsJmEBZNarwAGVSOwakU3HaK+05dZSIRHS4J37pMvCUWwZzAkCf3/nUmNe
	 ofjl0uEL4i/MLYDdLxZDp6MpLMb//IPGGo1AY2by06Jwpz1XImhOooyUM0U3gsdXPS
	 cC4fnm7h7HRWsGrRI/h7pJh+0KMMtEKLeX6UmcYsl1oQT9vZEQp/XznCFN93i38/Lg
	 I0CYjXLlNOHhQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rCkFz-0006L3-2M;
	Mon, 11 Dec 2023 18:39:51 +0100
Date: Mon, 11 Dec 2023 18:39:51 +0100
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
Message-ID: <ZXdJZ6yfK0NWz_zj@hovoldconsulting.com>
References: <20231211132608.27861-3-johan+linaro@kernel.org>
 <ZXdGxI0OrIUKrbcS@be2c62907a9b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXdGxI0OrIUKrbcS@be2c62907a9b>

On Tue, Dec 12, 2023 at 01:28:36AM +0800, kernel test robot wrote:
> Hi,
> 
> Thanks for your patch.
> 
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
> 
> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
> 
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
> Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Limit speaker digital volumes
> Link: https://lore.kernel.org/stable/20231211132608.27861-3-johan%2Blinaro%40kernel.org

Please fix your robot. This is a series of stable kernel backports so
the above warning makes no sense.

Johan
