Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3DA621
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8P6fcTVxsMF519vNXnL9K7OSXAWwfB2dslsfi2BADrA=; b=U85b1ouWKxJgMjYKeI2BS1kt/x
	1ecu6ZjrDAB0Gece6y8Tx62OpQCKvlBJdTuEQH1ijqjEPEIYfXhdrPw5xBNcRwq3Eg538brhB4ZDO
	qYBPpLKlOD+CEw2fY6xAK3UO3dlR1OX/b/GYuwDkubtVfmXSdD9Og87O21QZYcdEwBoY11WxJnG3T
	wVT882c1dhHpCYHVJ87FU4NcmWYtqAPyJIL0yWBspd07tmrKb+Dre5PJE83hgZPu6APwO/37MGxyi
	XCtSutKM39jB+BDXHWfv29ow2fnQ37ebje+7qxW5HAnJZ02bCoWm8OqJh2XVSo+odiOgaviY69G4J
	eGqPdczw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1puj8M-009NV4-03;
	Fri, 05 May 2023 00:17:14 +0000
Message-ID: <aa2efa2f-70ea-09b4-f21b-8e69f18fad1e@infradead.org>
Date: Thu, 4 May 2023 17:17:12 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [tip:master 4/4] htmldocs: Warning: arch/x86/Kconfig references a
 file that doesn't exist: Documentation/x86/shstk.rst
To: kernel test robot <lkp@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@kernel.org>, linux-doc@vger.kernel.org
References: <202305050705.5V1x1V3i-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202305050705.5V1x1V3i-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/4/23 16:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> head:   da1c4f07aa4dd227a57103fef1215e7cef3f35a9
> commit: da1c4f07aa4dd227a57103fef1215e7cef3f35a9 [4/4] Merge branch 'x86/shstk'
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=da1c4f07aa4dd227a57103fef1215e7cef3f35a9
>         git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
>         git fetch --no-tags tip master
>         git checkout da1c4f07aa4dd227a57103fef1215e7cef3f35a9
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305050705.5V1x1V3i-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/shstk.rst

which has been moved to Documentation/arch/x86/shstk.rst.

+cc: linux-doc

-- 
~Randy
