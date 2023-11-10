Received: from smtp.chopps.org (smtp.chopps.org [54.88.81.56])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6246A38DC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chopps.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chopps.org
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from dhcp-9b29.meeting.ietf.org.chopps.org (dhcp-9b29.meeting.ietf.org [31.133.155.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.chopps.org (Postfix) with ESMTPSA id 447F17D06C;
	Fri, 10 Nov 2023 19:00:19 +0000 (UTC)
References: <20231110113719.3055788-6-chopps@chopps.org>
 <202311110118.MvEGQstw-lkp@intel.com>
 <m27cmpxy5v.fsf@dhcp-9b29.meeting.ietf.org>
User-agent: mu4e 1.8.14; emacs 28.2
From: Christian Hopps <chopps@chopps.org>
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Christian Hopps <chopps@chopps.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next 5/8] iptfs: netlink: add config (netlink) options
Date: Fri, 10 Nov 2023 19:58:47 +0100
In-reply-to: <m27cmpxy5v.fsf@dhcp-9b29.meeting.ietf.org>
Message-ID: <m234xdxwla.fsf@dhcp-9b29.meeting.ietf.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Actually I need to add the new attributes to the switch statement too. They are u16 u32 and flag so no special compat conversion needed I think.

Thanks,
Chris.

Christian Hopps <chopps@chopps.org> writes:

> This seems like a rebase issue that I didn't catch.. For me though things
> compiled and my tests passed. The fix is obvious (pick the correct max value for
> the build bug on).. unless you indicate otherwise i'll fix this locally but not
> issue new RFC patches yet.
>
> Thanks,
> Chris.
>
> kernel test robot <lkp@intel.com> writes:
>
>> Hi Christian,
>>
>> [This is a private test report for your RFC patch.]
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on klassert-ipsec-next/master]
>> [also build test ERROR on klassert-ipsec/master netfilter-nf/main linus/master v6.6 next-20231110]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:
>> https://github.com/intel-lab-lkp/linux/commits/Christian-Hopps/iptfs-uapi-ip-add-ip_tfs_-_hdr-packet-formats/20231110-203822
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
>> patch link:    https://lore.kernel.org/r/20231110113719.3055788-6-chopps%40chopps.org
>> patch subject: [RFC ipsec-next 5/8] iptfs: netlink: add config (netlink) options
>> config: x86_64-buildonly-randconfig-004-20231110
>> (https://download.01.org/0day-ci/archive/20231111/202311110118.MvEGQstw-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20231111/202311110118.MvEGQstw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202311110118.MvEGQstw-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from <command-line>:
>>    In function 'xfrm_xlate32_attr',
>>        inlined from 'xfrm_xlate32' at net/xfrm/xfrm_compat.c:575:9:
>>>> include/linux/compiler_types.h:425:45: error: call to
>>> '__compiletime_assert_709' declared with attribute error: BUILD_BUG_ON failed:
>>> XFRMA_MAX != XFRMA_MTIMER_THRESH
>>      425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>          |                                             ^
>>    include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
>>      406 |                         prefix ## suffix();                             \
>>          |                         ^~~~~~
>>    include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
>>      425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>          |         ^~~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>          |                                     ^~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>>          |         ^~~~~~~~~~~~~~~~
>>    net/xfrm/xfrm_compat.c:437:17: note: in expansion of macro 'BUILD_BUG_ON'
>>      437 |                 BUILD_BUG_ON(XFRMA_MAX != XFRMA_MTIMER_THRESH);
>>          |                 ^~~~~~~~~~~~
>>    net/xfrm/xfrm_compat.c: In function 'xfrm_xlate64_attr':
>>    include/linux/compiler_types.h:425:45: error: call to
>> '__compiletime_assert_708' declared with attribute error: BUILD_BUG_ON failed:
>> XFRMA_MAX != XFRMA_MTIMER_THRESH
>>      425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>          |                                             ^
>>    include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
>>      406 |                         prefix ## suffix();                             \
>>          |                         ^~~~~~
>>    include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
>>      425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>          |         ^~~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>          |                                     ^~~~~~~~~~~~~~~~~~
>>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>>          |         ^~~~~~~~~~~~~~~~
>>    net/xfrm/xfrm_compat.c:282:17: note: in expansion of macro 'BUILD_BUG_ON'
>>      282 |                 BUILD_BUG_ON(XFRMA_MAX != XFRMA_MTIMER_THRESH);
>>          |                 ^~~~~~~~~~~~
>>
>>
>> vim +/__compiletime_assert_709 +425 include/linux/compiler_types.h
>>
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  411
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  414
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  415  /**
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  419   *
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  422   * compiler has support to do so.
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  423   */
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>> eb5c2d4b45e3d2 Will Deacon 2020-07-21  426

