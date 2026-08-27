Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72337EFFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848962; cv=none; b=Eq6LCM/8qRcR8SQyldU5MyFZXDaor9QZEWqqY5b4byQ1nGMBPXftxL5p60EWcKsDyvnNwMTdsosudovvb2Tg5cjTSMbnUZjwCaC+9UItBjnjhmXLDPtYuwnOhHLxeeK7cESCfvAyftcidHBa07K/UCzqCdQHE6c9TIyR5t0xMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848962; c=relaxed/simple;
	bh=sPGvdUYvO7fpucR0pdCt6gCxTbX4Una0yoMmxcC2yD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLJvVLynIvszZpwzIKfwAoCQZqLselz7DNHu+90bc2+nwEARxERDLiz/5cbgBGRwVXQSmOai6GyMH0bL83zU37oO8Wt+ISpuG56qYaiLmr9xsSsdiO8vg+ZFKT6mK7I7Ikt/HFM8n1jaxfEY3vhq7KO+kLPja683c9CEWXUN2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRhtlYry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRhtlYry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325F71F000E9;
	Thu, 27 Aug 2026 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787848959;
	bh=hC8yprawrh8DRVhXBUS+WOgzhbITHfzDxe/J4AuOB3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YRhtlYryDByhyfggTjdAMx+EYPoEKBsUXDJMV8JynL3JlekLUuqOR6+th2b1TyChz
	 t7pmHnBf3WIIz3d2vRSgBZP2KfONV/TB7wpZdKHqCMIK7fiBwN0fFOunxa+Md7RuU2
	 5bi+cicrY3zgEvMn0QyjYBKxKs9UhFFisBbyj0eVGZukjISgVbbYXWpTbOFCzigc7F
	 pcSMxBbSi+x++NNlhXb9R2KqCs1WjsbBly/NOXlvB1QCziJQbufTqs/1oUDbbMlPqQ
	 5ZYPNofo/JhKmMY7o2p8z13CwIgogRUy/T9vGyN2IBlwT+kjSp2526wnIRboH/p1PZ
	 hUgHvl7nKaGhQ==
Message-ID: <c269583e-3d53-41f2-865d-e609a3b2fb4b@kernel.org>
Date: Thu, 27 Aug 2026 11:42:38 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ksinyuk:drm-tip 6/12] amdgpu_dm_connector_test.c:undefined
 reference to `parse_hdmi_amd_vsdb'
To: Doug Anderson <dianders@chromium.org>, Alex Huang <Alex.Huang2@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Ruben Wauters <rubenru09@aol.com>,
 kernel test robot <lkp@intel.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <202608272312.xpie6XDa-lkp@intel.com>
 <CAD=FV=XbqrLPDB9EviJ5h0jWv4XDR_ujkCmqaUcHFTL8zeiUVw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD=FV=XbqrLPDB9EviJ5h0jWv4XDR_ujkCmqaUcHFTL8zeiUVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/27/26 10:47 AM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Aug 27, 2026 at 8:31 AM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ksinyuk/linux.git drm-tip
>> head:   e3e05bddbe9fea67639d2a3551e7cf2d473b804c
>> commit: 6fa42e05f7e63d41ade0e59fa5d94ca8028f7887 [6/12] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
>> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260827/202608272312.xpie6XDa-lkp@intel.com/config)
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608272312.xpie6XDa-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202608272312.xpie6XDa-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_cea_ext':
>>>> amdgpu_dm_connector_test.c:(.text+0x8cfe): undefined reference to `parse_hdmi_amd_vsdb'
>>     /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_no_extensions':
>>     amdgpu_dm_connector_test.c:(.text+0x91c8): undefined reference to `parse_hdmi_amd_vsdb'
>>     /usr/bin/ld: drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.o: in function `dm_test_parse_hdmi_amd_vsdb_null_edid':
>>     amdgpu_dm_connector_test.c:(.text+0x95ca): undefined reference to `parse_hdmi_amd_vsdb'
>>     /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `deregister_tm_clones':
>>     crtstuff.c:(.text+0x7): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
>>     /usr/lib/gcc/x86_64-linux-gnu/14/crtbegin.o: in function `register_tm_clones':
>>     crtstuff.c:(.text+0x38): relocation truncated to fit: R_X86_64_32S against `.tm_clone_table'
>>     collect2: error: ld returned 1 exit status
> 
> Not that this error seems to have anything to do with me, but I did a
> quick grep and my best guess is that the error you're seeing is
> related to this patch:
> 
> commit f65198b3d07389afdcb48e4ad00fea2aded95dfd
> Author:     Alex Huang <Alex.Huang2@amd.com>
> AuthorDate: Tue Aug 4 10:33:37 2026 -0400
> Commit:     Mario Limonciello <superm1@kernel.org>
> CommitDate: Mon Aug 10 23:26:00 2026 -0500
> 
>      drm/amd/display: Use HDMI FreeSync range from common EDID parser
> 
>      HDMI FreeSync on amdgpu is detected using the AMD VSDB parser in the
>      DMUB firmware, now that the common DRM EDID parser can do the same, use
>      the common parser.
> 
>      Extend get_amd_vsdb() to copy the relevant flags and data now being
>      extracted from the AMD VSDB. Additionally, parse_hdmi_amd_vsdb() and the
>      parse_edid_cea() firmware helpers now have no callers; remove them.
> 
>      Signed-off-by: Alex Huang <Alex.Huang2@amd.com>
>      Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>      Link: https://patch.msgid.link/20260804143339.714548-3-Alex.Huang2@amd.com
>      (Adjust for movement to amdgpu_dm_connector.c)
>      Signed-off-by: Mario Limonciello <superm1@kernel.org>
> 
> That seems to have removed the parse_hdmi_amd_vsdb(). Despite the
> commit message, the function prototype is still in a header and there
> are still callers to it in amdgpu_dm_connector_test.c.
> 
> Adding the two people involved in that patch to this email thread.
> 
> Seems like the kernel test robot could use some help identifying the
> proper patch / people involved.
> 
> -Doug

Alex (Deucher) is planning to send a PR after the merge window with the fix.
