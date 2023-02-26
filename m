Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BF384
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 02:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677377632; x=1708913632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3MuFWs9zdVjhaMajVQx5yaJhV2Dr75VvXt4HPCR6Xs=;
  b=mP0A2z1rb67MH4dsGgxTN19QxdJTQp52hMvFFjcwaDM+49qMR3HpTbp9
   E4HYaMx8lRu+id0duG3hReiYGIOlMdEriC2f1RA5lFHaqEfB2sERHmrKV
   ot3tfue8Ewytz6BUW+moXeCPGQz3aN91AkuZBdyKYIF0rGSq1K4e+Xt/f
   ijZtkiXOe88ZCEb9pqdRxAeCUXQCU+pp/FHV+OBi83LSphdOBCz1ujc4q
   p9+xch7Z5nvxYhNIrngRtuHFGydLjRP4AL9avBua4EzDduOZYtx/uOU22
   NB/AHCgbOkLg64l0OQPhtfqyTaAFAIRDpt8mO4iYnrRJW+RucOpkPZdQH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="332403908"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="332403908"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 18:13:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="782849665"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="782849665"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2023 18:13:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW6Xp-0003Ur-25;
	Sun, 26 Feb 2023 02:13:45 +0000
Date: Sun, 26 Feb 2023 10:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:orc-unwind-hint-refactor-2 2/4]
 arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end'
 does not exist for macro `unwind_hint'
Message-ID: <202302261000.ndQAA6Cj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git orc-unwind-hint-refactor-2
head:   e37c67067de5ba94dbd3f42c7174caff1cac6c48
commit: 1fb3be8fb8c57ad5321008e42f37a2fc7f380984 [2/4] objtool: Use relative pointers for annotations
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230226/202302261000.ndQAA6Cj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=1fb3be8fb8c57ad5321008e42f37a2fc7f380984
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe orc-unwind-hint-refactor-2
        git checkout 1fb3be8fb8c57ad5321008e42f37a2fc7f380984
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302261000.ndQAA6Cj-lkp@intel.com/

Note: the jpoimboe/orc-unwind-hint-refactor-2 HEAD e37c67067de5ba94dbd3f42c7174caff1cac6c48 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/include/asm/GEN-for-each-reg.h: Assembler messages:
>> arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:6:   Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:6:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:6:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:6:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:6:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:7:   Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:7:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:7:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:7:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:7:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:8:   Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:8:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:8:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:8:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:8:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:9:   Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:9:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:9:    Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:9:       Info: macro invoked from here
>> arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:9:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:10:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:10:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:10:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:10:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:10:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:12:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:12:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:12:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:12:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:12:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/include/asm/GEN-for-each-reg.h:36:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:13:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:13:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/GEN-for-each-reg.h:11:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:36:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:13:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: bad expression
   arch/x86/include/asm/GEN-for-each-reg.h:56:  Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:24:   Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:28:    Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:424:     Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:39:      Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:13:       Info: macro invoked from here
   arch/x86/include/asm/GEN-for-each-reg.h:144: Error: junk at end of line, first unrecognized character is `e'
--
   arch/x86/entry/entry_64.S: Assembler messages:
>> arch/x86/entry/entry_64.S:15: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/entry/entry_64.S:88:  Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:15:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:88:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:15:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:88:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:90:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:121:    Info: macro invoked from here
   arch/x86/entry/entry_64.S:109:     Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:90:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:121:    Info: macro invoked from here
   arch/x86/entry/entry_64.S:109:     Info: macro invoked from here
   arch/x86/entry/entry_64.S:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/entry/entry_64.S:208:  Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:208:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:208:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/entry/entry_64.S:289:  Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:289:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:289:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:299:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:299:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:11: Error: Parameter named `end' does not exist for macro `unwind_hint'
   arch/x86/entry/entry_64.S:306:  Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:306:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:11:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:306:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:56:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:333:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:56:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:333:   Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: bad expression
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:90:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:121:    Info: macro invoked from here
   arch/x86/entry/entry_64.S:334:     Info: macro invoked from here
>> arch/x86/entry/entry_64.S:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/entry/entry_64.S:48:  Info: macro invoked from here
   arch/x86/entry/entry_64.S:90:   Info: macro invoked from here
   arch/x86/entry/entry_64.S:121:    Info: macro invoked from here
   arch/x86/entry/entry_64.S:334:     Info: macro invoked from here
>> arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
>> arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
>> arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: bad expression
   arch/x86/include/asm/idtentry.h:48:  Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:52:   Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:501:    Info: macro invoked from here
   arch/x86/include/asm/idtentry.h:144: Error: junk at end of line, first unrecognized character is `e'
..


vim +11 arch/x86/include/asm/GEN-for-each-reg.h

a92ede2d584a2e Peter Zijlstra 2021-10-26 @11  GEN(rbp)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  12  GEN(rsi)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  13  GEN(rdi)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  14  GEN(r8)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  15  GEN(r9)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  16  GEN(r10)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  17  GEN(r11)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  18  GEN(r12)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  19  GEN(r13)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  20  GEN(r14)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  21  GEN(r15)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  22  #else
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  23  GEN(eax)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  24  GEN(ecx)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  25  GEN(edx)
a92ede2d584a2e Peter Zijlstra 2021-10-26  26  GEN(ebx)
a92ede2d584a2e Peter Zijlstra 2021-10-26  27  GEN(esp)
a92ede2d584a2e Peter Zijlstra 2021-10-26  28  GEN(ebp)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  29  GEN(esi)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  30  GEN(edi)
ca3f0d80dd57c8 Peter Zijlstra 2020-04-22  31  #endif

:::::: The code at line 11 was first introduced by commit
:::::: a92ede2d584a2e070def59c7e47e6b6f6341c55c x86/asm: Fix register order

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
