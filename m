Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877D7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 08:59:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27FA1228B5;
	Thu, 17 Nov 2022 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1668675561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgHObFT8S/RhWZmZ2U98xsw3fSf5/hjBYqpfnv2mPv8=;
	b=aKBDT9UQ7yElIZox25zXAc5DdyR48riK2ByJfVG4/+0Rykt6zFITb1H0eDY6YqQcvn9gY0
	1BLTBiJyprTJ6pwAdj3M3BCOS/Re0nc3KQCCfwBVrR4JC/u6uxg6qA3yD8sm4RpKnbFSw5
	eDoPhVM+bICeb48TX6P85yOcvEMcXV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1668675561;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgHObFT8S/RhWZmZ2U98xsw3fSf5/hjBYqpfnv2mPv8=;
	b=3paNrpfaU4S1aX5zu0rndDI3fWn0p9ASP7CfRZtwHD/ptNJR0BO3uh86gbHz2HwAX5fITO
	C2n6oh5avxedQlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1264813A12;
	Thu, 17 Nov 2022 08:59:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tEG1A+n3dWPjTwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 17 Nov 2022 08:59:21 +0000
Message-ID: <c1abf325-4b98-3d5b-a31e-c7c6085494a9@suse.cz>
Date: Thu, 17 Nov 2022 09:57:35 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [lkp] [+5395 bytes kernel size regression] [i386-tinyconfig]
 [b7c8731082] Deprecating and removing SLOB
Content-Language: en-US
To: Josh Triplett <josh@joshtriplett.org>, oe-kbuild-all@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
References: <c1caa5ce-eeaf-8038-2dea-051c98aade45@suse.cz>
 <Y25E9cJbhDAKi1vd@99bb1221be19> <Y26FN02o7jhV87wl@localhost>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <Y26FN02o7jhV87wl@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/22 18:24, Josh Triplett wrote:
> On Fri, Nov 11, 2022 at 08:49:57PM +0800, kernel test robot wrote:
>> FYI, we noticed a +5395 bytes kernel size regression due to commit:
>>
>> commit: b7c873108294f0fd19c7e4d6b038a05375b3cd33 (Deprecating and removing SLOB)
>> url: https://github.com/intel-lab-lkp/linux/commits/Vlastimil-Babka/mm-slob-rename-CONFIG_SLOB-to-CONFIG_SLOB_DEPRECATED/20221111-183529
>> base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
>> patch subject: [PATCH] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
>>
>>
>> Details as below (size data is obtained by `nm --size-sort vmlinux`):
>>
>> e1e3de44: Merge branch 'mm-nonmm-unstable' into mm-everything
>> b7c87310: Deprecating and removing SLOB
> 
> This patch has the net effect of switching tiny over from SLOB to SLUB,
> which causes a 5k+ size regression.
> 
> I *absolutely* appreciate the value of removing this much code, and I'm
> not going to propose keeping SLOB for the sole reason of being 5k
> smaller; it's not worth keeping a whole allocator for that. I also
> wouldn't be surprised if we get *some* of that back by simplifications
> this change enables in the rest of the kernel.
> 
> But I'm wondering if there might be any low-hanging fruit that could
> slim down SLUB to the tune of 5k or so, that has been previously ignored
> because SLOB served that use case? For instance, largely self-contained
> bits of SLUB functionality that could be omitted on the tiniest of
> systems?

Hi, could you test this one please
https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=slub-tiny-v1r1
I've updated kernel/configs/tiny.config there to include 
CONFIG_SLUB_TINY so should be picked up.

> - Josh Triplett

