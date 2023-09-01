Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A8A943
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ticaJeELIb4UfL4X2wVoYRyjHnK1POfBn5mPm9BVh0s=; b=CaTePVe36t2iU8rRSn725V+HCr
	4hxaIxDk89a60jUd3/gkjWZeTSzRxP5n1DAjr9ICr2SkyloZxeLpGevt2UMEVI6OiQdLquA/HaXoD
	2BDxzitN0GX50gDRTbqN3NknSkB+8RYukA9W7uEUc7fSkCeony4agvSNoS7Ggn3XrSiSnGsD86LsC
	9AqreatPdYzcP4Ou31LNrortJJLZzGWJDMCT/9/iUxRaCihIzUdDiwK3YVWn1k/yAwxVVEs7UK0Cu
	dmtbERRTrlQTXTh80uCf+K60jdJ+OhZ8ukitptJFUW5++pQWLHkMNDpzbyWRE/IuUUrEQlNQWuwHV
	OLBnpVyg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qc2E5-000GzU-Pj; Fri, 01 Sep 2023 13:22:10 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qc2E5-0005Mj-T8; Fri, 01 Sep 2023 13:22:09 +0200
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
To: Eduard Zingerman <eddyz87@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202309010804.G3MpXo59-lkp@intel.com>
 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
Date: Fri, 1 Sep 2023 13:22:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27018/Fri Sep  1 09:45:38 2023)

On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
>> On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
>>> Hi Eduard,
>>>
>>> On 9/1/23 2:05 AM, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
>>>> head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
>>>> commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
>>>> reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
>>>>
>>>> All warnings (new ones prefixed by >>):
>>>>
>>>>>> Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
>>>>>> Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf
>>>
>>> Could you send a follow-up fix for bpf tree?
>>
>> Hi Daniel,
>>
>> Will send the fix shortly. Strangely, I did check this syntax locally
>> before sending the original patch, and had no warnings reported.
> 
> I followed reproducing instructions but can't trigger this warning,
> tried several sphinx versions:
> - 1.7.9
> - 2.4.4
> - 4.3.2
> 
> I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> labels from the documents (and these are link labels, not actual
> links), but it looks like I don't have a way to check the results in a
> way compatible with test robot.

Strange, perhaps LKP folks could chime in and provide some more guidance e.g.
wrt Sphinx version.

Thanks,
Daniel
