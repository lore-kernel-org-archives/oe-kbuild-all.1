Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887849;
	b=wYNLOxfB9+n2WmSUQI0QVnb+DAw89vFlzFviSRppDuoIXCZftpUV8UxFS7qhJLrZok+J
	 TP+das0GSgG+26h6Wi+STybto37yUvrVIVTVau+1id+0qn3+oV84D2tAxQAT0tRytuy8r
	 J+JB6c2GZ8a7lY33y5oyLemFo97KGMNQcOgIHZ0g76mDelhdxzvyPHTxCJrpBQ8UWW+li
	 OA9CRZYJ4OCmMiphbozcG2P3BGZ6GM1qWS0OQou4NuA1vW4NIbjYMbXRtbrWWh+uNeZK/
	 ZWcXK4a24wQbIGK5NuT6MInbTA6FB+x8fH/vFLI8IV1OjFiVF+vww3O99NrUZkUVZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
	b=lWvkuy7q8TEXOGxE5F3skQpyoIf0id5Ju6haglIeNcSHTF1vE8UatEJOsdm4e3bdhJ08
	 u+tPkWX2rXZcwRh36GRyy7Ec/ZtFIrqxb1cg/HIKdyCpcvlrvQYnuJwSjVUgdMIf/vJyK
	 oKauws2lPLZSt8v0nkei9bRiMg+C50lDVAEKBTUUNtLHb2Y2ZZJRgl+xoHn3CTSkLo/uR
	 u+mG2yZUJUCGpt5Y1/Tt3HbVhCsB4HDrFWExKcBdEbLzPN+Gi4+OiL98dWF5Jp0RjUOhN
	 I5B+JajhahKFfsGVeVbwpB770J8o2zSODGeJkrHn1cxDgMQhiS69VHzoUkTfNrjtKpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOTs1obN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A56606D810
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 14:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A56606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bOTs1obN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7589395e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Nov 2026 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887847; x=1794492647; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
        b=bOTs1obN4TmnAF27c5oPDfuvzlO6j/KIj8+hzmedgkBukqAN/UV7hD0LyV6lLAR7CL
         9l+zthLtFvXkzUT8vT1EU8SlZk/PAfzTYEYND/sm5DY8vwVNPpGEyOjDw37VNMyLoAlT
         oKWnP8NcAoI98tveuwHAteF8d/d29yduFCpuS4V7eFXVYpdrTaj7fVYmfKyGrj0sOVep
         Wbr3UsJr5J1qva7kWUhj6tU/OESB7qGe0EwNf/1V4XsR+sez99fvj2IP3Cmv2ecqDqtM
         OyvYzaVtK2xPVgxiY3EIcYMfnBVzvfI4LiKvr3bEmQ170MYGUOS9CcCiw5m+DiPyKrXV
         6tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887847; x=1794492647;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9WpazFpM6I0q66z3jQ1jZHrE4ERqM6y4gAesIV9RtI=;
        b=fJwqzQPqndywnj19yN5F9TeGOd7V5yK6/UCPyP4AaZgrRzclupT6eeDC2/VpPbM0BF
         upVKCIowiqKy0xyJaRcID7G86lL6m6xleR82JNXZbW32vFKUfL+8w9L0svrYj0L7XDUw
         6i1eSHI3A1X4NJBBk7rKIT0AGWlS7sNcsV1N1/c7kppr9wpTUB8ChZVz7hbYggtinNUc
         6xQBctPt1w3VzB7l1h0fXPu5lUMBtWAUThZMDdWFbMvIStfIiSjD0gYK2viV73Rg4KCn
         +xX0ycUxuCEjMUHs3kmREUhXFLC9Cvhzkyys1/3MoM09+dKQyNkYhYD1k3u1Hw88Q7TO
         srIA==
X-Forwarded-Encrypted: i=1; AKwUvBwoa7kbXExx9BrOUZZvyMTt4HSM+//hAIv6g/v+PUrulD1To+qlrmcF7/+6A6jkcdIHrmtFPts1pZTsal3l@lists.linux.dev
X-Gm-Message-State: APuU4Z/D6fTWFBK71WnaoJ2QjvmTxLjIncwQNCpvbzrwNw0+HhnBQikJ
	mAvUZkMT5fFaSl3bPGaqUoO1cfna1Trg306FCKDXM9LGznOiB/Nvtxy8
X-Gm-Gg: AYBFou0E/fnOdZkPtJrjQFIa1jBzFbJZ2wudUVyRjUPQK+Jgu9zOXXqK04BZGgrIhK2
	RjSv4BpcLNYAk5v9JAZA5H0RTl8sJWQQD9TP3VJ6kiIvZ1spFuXdSIr2wId7cKtDyTy4lfHAFbb
	u3OlJgo0kfIT1ICKN/dqlcNo0FRcvEIj1n0+r1HL0H9i/byCPevrFzCSUBvuTj/42Gd7yygFOt3
	S8BRy8a1n38ALQ7SGysgawc83LocVluFmT3tJHO1KH0thfqc8QGjw1M5PK3L+TxAeGbub7p4v5E
	R4IQdsEg0yXHK1cG6OGwy/3ufYLgeZ5ciclwRjZHbtMFGd2C82tFO199SKxXpWxz+clwPNkaL0h
	+mUmvmw4BetTAuGeVGu+Q4d8h4eqtUqa+vGteG/kcrGQs393btFawgCMIg/1r7J3RwwfM17gY9G
	4wmDBJrDx0sSCWzK5N0pq+C0ULfFVRSXZ3gXkfhcEOhBNodaoJvtw/UPd10NIszQN6hCH6sT47f
	Ih8VlizU+S0pxz0Cp1SVrC3wPhqVl6Zy1qcCJIR9kdvIty4Z9kjdvgYN7nOYD7FU48dmkhY60dZ
	sqgt48EEa+metFI92J+J9sSwfnBxyVB8wQkxcl2sRoUHKyi/muM3HS06oQS++v2gfP9rzB430/1
	7ushPOeeZwLdLOVwX3nPBV1zv37diyebEsQllDgzwsdhYqNNba38aLbS9m/eHhb+/nA==
X-Received: by 2002:a05:600c:1907:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b55c8743d8mr49455515e9.3.1793887846817;
        Thu, 05 Nov 2026 06:10:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm82347785e9.8.2026.11.05.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:10:45 -0800 (PST)
Date: Thu, 5 Nov 2026 17:10:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable
 dereferenced before check 'buffer' (see line 2172)
Message-ID: <auyOYRv7V49kTSJ5@stanley.mountain>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 5ecbcb61e172d82faf1bd8c00b17837d3c658c59 [390/390] ANDROID: ring-buffer: Introducing external writer support
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051422.WODTXWDt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611051422.WODTXWDt-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:2177 ring_buffer_resize() warn: variable dereferenced before check 'buffer' (see line 2172)

vim +/buffer +2177 kernel/trace/ring_buffer.c

13292494379f92 Steven Rostedt (VMware    2019-12-13  2165) int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
438ced1720b584 Vaibhav Nagarnaik         2012-02-02  2166  			int cpu_id)
7a8e76a3829f10 Steven Rostedt            2008-09-29  2167  {
7a8e76a3829f10 Steven Rostedt            2008-09-29  2168  	struct ring_buffer_per_cpu *cpu_buffer;
9b94a8fba501f3 Steven Rostedt (Red Hat   2016-05-12  2169) 	unsigned long nr_pages;
0a1754b2a97efa Qiujun Huang              2020-10-19  2170  	int cpu, err;
7a8e76a3829f10 Steven Rostedt            2008-09-29  2171  
5ecbcb61e172d8 Vincent Donnefort         2022-08-24 @2172  	if (unlikely(has_ext_writer(buffer)))
                                                                                            ^^^^^^
Unchecked dereference

5ecbcb61e172d8 Vincent Donnefort         2022-08-24  2173  		return -EINVAL;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2174  	/*
ee51a1de7e3837 Ingo Molnar               2008-11-13  2175  	 * Always succeed at resizing a non-existent buffer:
ee51a1de7e3837 Ingo Molnar               2008-11-13  2176  	 */
ee51a1de7e3837 Ingo Molnar               2008-11-13 @2177  	if (!buffer)
                                                                    ^^^^^^^
Checked too late.

0a1754b2a97efa Qiujun Huang              2020-10-19  2178  		return 0;
ee51a1de7e3837 Ingo Molnar               2008-11-13  2179  
6a31e1f135d1ab Steven Rostedt            2012-05-23  2180  	/* Make sure the requested buffer exists */

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

