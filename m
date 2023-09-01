Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765795393
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 06:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0yVlZhVTDHsPKDCknPqs3aBxvYkcIanhygteaa9APgg=; b=C11jvKceZpY6nbsGS9oZUyC7MD
	NkFICre9tp09O708ClbQEoR0zn1rLgM62NOgLenWAvMswL0RHTXAkc6Aw9sgHVLPvA1mGPgEUh3C6
	o0f0W0XpjzFTBCm2X0imrRsSUFHWLV1kdthDnK3skdYSbisKagUJrsZ9rFDyRtVHiBn7+mvuWnHxa
	rFBFRQZOIuHkdh1BOl78syvA/k+GthWSLmEYEYTIMmPrE4x43vES4AQp9+xwCt4EJcGI6kpeCxMDI
	Tbp712R3iQ9jgzt2L5b1+ItxRvy1hf0gg05Uam7N8TLIsiON1RZrz8JtCRybvA9Sacmt7f4XwOPdR
	FU2KYYFQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qbxep-0005Bo-9v; Fri, 01 Sep 2023 08:29:27 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qbxep-000K2Q-Cm; Fri, 01 Sep 2023 08:29:27 +0200
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
To: kernel test robot <lkp@intel.com>, Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202309010804.G3MpXo59-lkp@intel.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
Date: Fri, 1 Sep 2023 08:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202309010804.G3MpXo59-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27017/Thu Aug 31 09:40:48 2023)

Hi Eduard,

On 9/1/23 2:05 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
> head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
> reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
>>> Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf

Could you send a follow-up fix for bpf tree?

Thanks,
Daniel
