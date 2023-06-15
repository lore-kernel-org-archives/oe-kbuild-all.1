Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344F168D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 15:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B749CC433C8;
	Thu, 15 Jun 2023 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686843143;
	bh=5SnATU7YmUxOsuenF/gejJC249yKQjYfPce/JOhUOWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fl5x6BF3ZWVLCdsRfnZDPwMf+Rqho+sOljaHwKieGLvj/epsiBM6p/IwzLENpvAP6
	 +J3ONH53Jn1cRaJ7a/cjZL99stBxCHywLr5TiCLvTed0Z5rtw0BB11shUBooaXIxJ/
	 FJ/3b1nFjHPTACkJNJKJvHZjEmrxkoKTS314VBMBfs0LuXkXzz6OtQEHbwUNOAa5Ns
	 vjdBPVh4VFH1h26YfpQmrZs3LJC060qJIZSTwX5MXtrD04voyOGp0uRh7kt3BPoozc
	 coU1L10Lt352hfJnTkVo2vFMSlwYNXRTEYT+9uFAMmPwrk5GxYWxP4dXlvNV2x3MXk
	 i3nBv6jWZQJQA==
Date: Thu, 15 Jun 2023 08:32:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Simon Horman
 <simon.horman@corigine.com>, Pieter Jansen van Vuuren
 <pieter.jansen-van-vuuren@amd.com>, "linux-net-drivers@amd.com"
 <linux-net-drivers@amd.com>
Subject: Re: [linux-next:master 8214/10326]
 drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to
 `ip_send_check'
Message-ID: <20230615083221.4ab529c2@kernel.org>
In-Reply-To: <a80867f3-a2b1-3ffb-d7b1-784e4bb94163@gmail.com>
References: <202306151656.yttECVTP-lkp@intel.com>
	<a80867f3-a2b1-3ffb-d7b1-784e4bb94163@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 Jun 2023 15:44:14 +0100 Edward Cree wrote:
> From which these errors follow, since these symbols are in net/ipv4/*.o.
> Not sure whether to put ifdefs in tc_encap_actions.c, or just make
>  CONFIG_SFC[_SRIOV?] depend on (or select?) CONFIG_INET.  Because is
>  there really a use case for putting an sfc NIC in a box without IP?

dependency on INET SGTM, FWIW.
