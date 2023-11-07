Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1632A21
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Mf8rjW9J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=UBMY1d2y3RsJrEe1GtLGGmfwPeS76uv/2C8RtDrfcBA=; b=Mf8rjW9JZsn5yc/x2QGe/NZUJf
	AgkzEEVe0a8+Xqx9sTEcga1sHkPVIJR7rYJ5AT0jF2FRLdzKqvuj1CnH+VlQGriihoVikAu570RW/
	Mgb3pPhZYlnfKtocOKVZ9LbxEIjB9KOWl2fJVJibuhg1wM8cRMCTQ5eSIm6Xphww72kzH/avnhsbp
	HGhvaoJ1yD0HY4ropbxBxEhfaOR1/WVWYHTJbEYdtzWLFymWfmjFE8SR8uf6PXmispGMME0Wy5BQg
	bd4EjEnoECK4FXU0MesxBR8Yx7C5qa6y/wzw9NA69tCaziO86vpElXaIaWAJg3VJs0CE291ISdgr3
	/jS8bexw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r0AFK-000Ejp-2L;
	Tue, 07 Nov 2023 00:47:10 +0000
Message-ID: <69db6062-4e6c-40da-994d-1f74abd828de@infradead.org>
Date: Mon, 6 Nov 2023 16:47:10 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SM_GCC_8550 when selected by SM_CAMCC_8550
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <202311062309.XugQH7AH-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202311062309.XugQH7AH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

On 11/6/23 07:05, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d2f51b3516dade79269ff45eae2a7668ae711b25
> commit: ccc4e6a061a21d75b96d82fc4b084a8d96df6eb4 clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
> date:   7 weeks ago
> config: arm-kismet-CONFIG_SM_GCC_8550-CONFIG_SM_CAMCC_8550-0-0 (https://download.01.org/0day-ci/archive/20231106/202311062309.XugQH7AH-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062309.XugQH7AH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311062309.XugQH7AH-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_8550 when selected by SM_CAMCC_8550
>    .config:7280:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
>    
>    WARNING: unmet direct dependencies detected for SM_GCC_8550
>      Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>      Selected by [y]:
>      - SM_CAMCC_8550 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
> 

Should SM_CAMCC_8550 depend on "ARM64 || COMPILE_TEST" like SM_GCC_8550 does?
It's not safe to "select" SM_GCC_8550 when neither of ARM64 or COMPILE_TEST is set.

thanks.
-- 
~Randy
