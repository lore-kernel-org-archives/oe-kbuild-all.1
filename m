Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993841B8FE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1683795227; bh=3kwInaX0y/CBqRowdPyoBe7JlgyxfjKN5weTY3XMVJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GznE5kgLEjsCulQAHzgIqo6nB5vO2SycPQ+srg4AueI6nI3g+P4+JKgTTWaEtTE12
	 vg67pbq1XBIEaMJh09EaCjpk/9YK5kyU+S6dvurKanN+nenbp2OMgiHSokJMzAW2U3
	 ZedhNVm6Q8cr/n0fB1P/YY5fNi8d661Yxgl0tx+I=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 13652600BD;
	Thu, 11 May 2023 16:53:47 +0800 (CST)
Message-ID: <b13b1fa3-8afb-b5d0-c48d-a97b0ac9a475@xen0n.name>
Date: Thu, 11 May 2023 16:53:46 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [agd5f:drm-next 226/226]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17: error:
 implicit declaration of function 'kernel_fpu_begin'; did you mean
 'dc_fpu_begin'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <202305111617.0zRJPm91-lkp@intel.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <202305111617.0zRJPm91-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/5/11 16:42, kernel test robot wrote:
> Hi Huacai,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
> head:   d3295311e589a14a7496f0e14b5be6c3b5d9e134
> commit: d3295311e589a14a7496f0e14b5be6c3b5d9e134 [226/226] drm/amdgpu/display: Enable DC_FP for LoongArch
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230511/202305111617.0zRJPm91-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
>          git fetch --no-tags agd5f drm-next
>          git checkout d3295311e589a14a7496f0e14b5be6c3b5d9e134
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/gpu/drm/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305111617.0zRJPm91-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_begin':
>>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17: error: implicit declaration of function 'kernel_fpu_begin'; did you mean 'dc_fpu_begin'? [-Werror=implicit-function-declaration]
>        95 |                 kernel_fpu_begin();
>           |                 ^~~~~~~~~~~~~~~~
>           |                 dc_fpu_begin
>     drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_end':
>>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:134:17: error: implicit declaration of function 'kernel_fpu_end'; did you mean 'kernel_read'? [-Werror=implicit-function-declaration]
>       134 |                 kernel_fpu_end();
>           |                 ^~~~~~~~~~~~~~
>           |                 kernel_read
>     cc1: some warnings being treated as errors
> 
> [snip]
I checked the https://gitlab.freedesktop.org/agd5f/linux repo and it 
seems the baseline is still v6.1.11. The arch/loongarch FPU functions 
only appeared in upstream v6.3. Do we arch/loongarch porters need to do 
anything to handle such a combination, or can the baseline be updated 
somehow?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

