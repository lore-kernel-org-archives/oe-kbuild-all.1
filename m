Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625E2368
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694155153; x=1725691153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BMeDArcxOy6M31O3Qzo+He+tzXN/ptFf1icfBEpR8vk=;
  b=STYEsFzrQ/wWTn9gkLb/nRX6akA5bzbwQ2r2yLA6dQV4AWu1B+P7kUR2
   6nvTf7E4b2KL5UDM6YQHJhL6TPMchji5VfIUeIK6O4AWol5BGEf6ehJ6D
   2TuLJAsWQ8ip1nEEiKG5SVguRcVyLfStZYIeO2Med9DGyqVVOw+N0NTLk
   MxWzh7lp4yVKDyankRiMEHIGeh6cBjRgxV0OeO+fMcn5+VokzYNOTnDpb
   mjBkpaiELSyCFHewyGbqVGXhiqyG+MclBXQrCpWFS2Bt6VMujlk938RzA
   hMDaYq5u+1StgruKKbWYR+vBOYzjfndQV2DBVjTvbwoyuHr/LuHHgHjRV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="380313013"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="380313013"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 23:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="771635619"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="771635619"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2023 23:38:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeV8k-0001zN-0s;
	Fri, 08 Sep 2023 06:38:50 +0000
Date: Fri, 8 Sep 2023 14:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Nick Alcock <nick.alcock@oracle.com>
Subject: [oracle-dtrace:v2/6.5 1/13] builtin:2:0: sparse: sparse: missing
 terminating " character
Message-ID: <202309081454.GQ0U5iOn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: acb632160f89e4c8caaaa6b8c6a94f13d06cadb5 [1/13] kbuild: add modules=
=2Ebuiltin.objs
config: x86_64-randconfig-121-20230908 (https://download.01.org/0day-ci/arc=
hive/20230908/202309081454.GQ0U5iOn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20230908/202309081454.GQ0U5iOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081454.GQ0U5iOn-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:3:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:26: sparse: sparse: got =7F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:3:0: sparse: sparse: missing terminating " character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =13
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got /
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:1: sparse: sparse: missing identifier in declaration
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =CC
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:16:0: sparse: sparse: missing terminating ' character
   builtin:41:7: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =FC
   builtin:24:17: sparse: sparse: Expected ; at the end of type declaration
   builtin:24:17: sparse: sparse: got =BA
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'y' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got =E4
   builtin:2:19: sparse: sparse: Expected ; at end of declaration
   builtin:2:19: sparse: sparse: got =E4
   builtin:3:44: sparse: sparse: Expected ; at end of declaration
   builtin:3:44: sparse: sparse: got =E4
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'AQ' was not declared. Should it be =
static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =EF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:1: sparse: sparse: missing identifier in declaration
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =EF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =02
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:15:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got !
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:41:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =BF
   builtin:24:28: sparse: sparse: Expected ; at the end of type declaration
   builtin:24:28: sparse: sparse: got =15
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got )
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =DF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating " character
   builtin:4:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got /
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got @
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'o' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =9C
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =15
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:16:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =0F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:5:0: sparse: sparse: missing terminating " character
   builtin:17:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =0F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =AE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =7F
   builtin:2:108: sparse: sparse: Expected ; at end of declaration
   builtin:2:108: sparse: sparse: got ^
   builtin:2:164: sparse: sparse: Expected ; at end of declaration
   builtin:2:164: sparse: sparse: got ^
   builtin:2:298: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:298: sparse: sparse: got >
   builtin:2:324: sparse: sparse: Expected ; at end of declaration
   builtin:2:324: sparse: sparse: got ^
   builtin:2:338: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:338: sparse: sparse: got =F4
   builtin:2:346: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:346: sparse: sparse: got =10
   builtin:3:28: sparse: sparse: Expected ; at end of declaration
   builtin:3:28: sparse: sparse: got ^
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:106: sparse: sparse: symbol 'jI' was not declared. Should it b=
e static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:11:127: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =F9
   builtin:3:63: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:63: sparse: sparse: got =03
   builtin:4:39: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:39: sparse: sparse: got =03
   builtin:7:55: sparse: sparse: Expected ; at the end of type declaration
   builtin:7:55: sparse: sparse: got =03
   builtin:9:7: sparse: sparse: Expected ; at the end of type declaration
   builtin:9:7: sparse: sparse: got =03
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =CA
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =8F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =7F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:1: sparse: sparse: missing identifier in declaration
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =BB
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =A8
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =CF
   builtin:2:107: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:107: sparse: sparse: got =DE
   builtin:2:163: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:163: sparse: sparse: got =DE
   builtin:2:323: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:323: sparse: sparse: got =DE
   builtin:3:27: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:27: sparse: sparse: got =DE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =C6
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =DF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got <
   builtin:2:99: sparse: sparse: Expected ; at end of declaration
   builtin:2:99: sparse: sparse: got <
   builtin:2:155: sparse: sparse: Expected ; at end of declaration
   builtin:2:155: sparse: sparse: got <
   builtin:2:315: sparse: sparse: Expected ; at end of declaration
   builtin:2:315: sparse: sparse: got <
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =9F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got $
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'e' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =A0
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got 3
   builtin:2:66: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:66: sparse: sparse: got =99
   builtin:2:98: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:98: sparse: sparse: got =99
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =A5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =AF
   builtin:2:245: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:245: sparse: sparse: got =7F
   builtin:3:31: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:31: sparse: sparse: got =7F
   builtin:4:13: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:13: sparse: sparse: got =7F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:1: sparse: sparse: expected identifier name in type definition
   builtin:3:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'v' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:15:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =CF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating " character
   builtin:4:225: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got %
   builtin:3:42: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:42: sparse: sparse: got =E9
   builtin:3:74: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:74: sparse: sparse: got =E9
   builtin:3:138: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:138: sparse: sparse: got =E9
   builtin:3:219: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:219: sparse: sparse: got =E9
   builtin:4:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:19: sparse: sparse: got =E9
   builtin:4:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:59: sparse: sparse: got =E9
   builtin:4:98: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:98: sparse: sparse: got =E9
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:40:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FC
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:223: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got /
   builtin:2:111: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:111: sparse: sparse: got =D3
   builtin:2:167: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:167: sparse: sparse: got =D3
   builtin:2:335: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:335: sparse: sparse: got =D3
   builtin:3:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:26: sparse: sparse: got =D3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
   drivers/acpi/acpica/nspredef.c: note: in included file:
   drivers/acpi/acpica/acpredef.h:187:34: sparse: sparse: symbol 'acpi_gbl_=
predefined_methods' was not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =A5
   builtin:4:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:19: sparse: sparse: got =A5
   builtin:4:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:59: sparse: sparse: got =A5
   builtin:4:91: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:91: sparse: sparse: got =A5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:0: sparse: sparse: missing terminating " character
   builtin:6:207: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =BF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:16:0: sparse: sparse: missing terminating ' character
   builtin:42:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =A3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =EF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =CD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =EF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =01
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:5:0: sparse: sparse: missing terminating ' character
   builtin:6:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =B7
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =03
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FF
   builtin:2:98: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:98: sparse: sparse: got =19
   builtin:2:154: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:154: sparse: sparse: got =19
   builtin:2:314: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:314: sparse: sparse: got =19
   builtin:3:12: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:12: sparse: sparse: got =E2
   builtin:4:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:26: sparse: sparse: got =19
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =9F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =80
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:1: sparse: sparse: missing identifier in declaration
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got $
   builtin:2:107: sparse: sparse: Expected ; at end of declaration
   builtin:2:107: sparse: sparse: got =D6
   builtin:2:163: sparse: sparse: Expected ; at end of declaration
   builtin:2:163: sparse: sparse: got =D6
   builtin:2:323: sparse: sparse: Expected ; at end of declaration
   builtin:2:323: sparse: sparse: got =D6
   builtin:3:27: sparse: sparse: Expected ; at end of declaration
   builtin:3:27: sparse: sparse: got =D6
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =CB
   builtin:2:106: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:106: sparse: sparse: got =84
   builtin:2:162: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:162: sparse: sparse: got =84
   builtin:2:322: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:322: sparse: sparse: got =84
   builtin:3:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:26: sparse: sparse: got =84
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E1
   builtin:3:49: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:49: sparse: sparse: got =D9
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
   drivers/acpi/acpica/utglobal.c: note: in included file (through include/=
acpi/acpi.h):
   include/acpi/acpixf.h:104:1: sparse: sparse: symbol 'acpi_gbl_enable_int=
erpreter_slack' was not declared. Should it be static?
   include/acpi/acpixf.h:113:1: sparse: sparse: symbol 'acpi_gbl_auto_seria=
lize_methods' was not declared. Should it be static?
   include/acpi/acpixf.h:120:1: sparse: sparse: symbol 'acpi_gbl_create_osi=
_method' was not declared. Should it be static?
   include/acpi/acpixf.h:126:1: sparse: sparse: symbol 'acpi_gbl_use_defaul=
t_register_widths' was not declared. Should it be static?
   include/acpi/acpixf.h:136:1: sparse: sparse: symbol 'acpi_gbl_enable_tab=
le_validation' was not declared. Should it be static?
   include/acpi/acpixf.h:141:1: sparse: sparse: symbol 'acpi_gbl_enable_aml=
_debug_object' was not declared. Should it be static?
   include/acpi/acpixf.h:149:1: sparse: sparse: symbol 'acpi_gbl_copy_dsdt_=
locally' was not declared. Should it be static?
   include/acpi/acpixf.h:157:1: sparse: sparse: symbol 'acpi_gbl_do_not_use=
_xsdt' was not declared. Should it be static?
   include/acpi/acpixf.h:167:1: sparse: sparse: symbol 'acpi_gbl_use32_bit_=
fadt_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:176:1: sparse: sparse: symbol 'acpi_gbl_use32_bit_=
facs_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:184:1: sparse: sparse: symbol 'acpi_gbl_truncate_i=
o_addresses' was not declared. Should it be static?
   include/acpi/acpixf.h:190:1: sparse: sparse: symbol 'acpi_gbl_disable_au=
to_repair' was not declared. Should it be static?
   include/acpi/acpixf.h:196:1: sparse: sparse: symbol 'acpi_gbl_disable_ss=
dt_table_install' was not declared. Should it be static?
   include/acpi/acpixf.h:201:1: sparse: sparse: symbol 'acpi_gbl_runtime_na=
mespace_override' was not declared. Should it be static?
   include/acpi/acpixf.h:207:1: sparse: sparse: symbol 'acpi_gbl_osi_data' =
was not declared. Should it be static?
   include/acpi/acpixf.h:214:1: sparse: sparse: symbol 'acpi_gbl_reduced_ha=
rdware' was not declared. Should it be static?
   include/acpi/acpixf.h:221:1: sparse: sparse: symbol 'acpi_gbl_max_loop_i=
terations' was not declared. Should it be static?
   include/acpi/acpixf.h:231:1: sparse: sparse: symbol 'acpi_gbl_ignore_pac=
kage_resolution_errors' was not declared. Should it be static?
   include/acpi/acpixf.h:237:1: sparse: sparse: symbol 'acpi_gbl_trace_flag=
s' was not declared. Should it be static?
   include/acpi/acpixf.h:238:1: sparse: sparse: symbol 'acpi_gbl_trace_meth=
od_name' was not declared. Should it be static?
   include/acpi/acpixf.h:239:1: sparse: sparse: symbol 'acpi_gbl_trace_dbg_=
level' was not declared. Should it be static?
   include/acpi/acpixf.h:240:1: sparse: sparse: symbol 'acpi_gbl_trace_dbg_=
layer' was not declared. Should it be static?
   include/acpi/acpixf.h:247:1: sparse: sparse: symbol 'acpi_dbg_level' was=
 not declared. Should it be static?
   include/acpi/acpixf.h:248:1: sparse: sparse: symbol 'acpi_dbg_layer' was=
 not declared. Should it be static?
   include/acpi/acpixf.h:252:1: sparse: sparse: symbol 'acpi_gbl_display_de=
bug_timer' was not declared. Should it be static?
   drivers/acpi/acpica/utglobal.c: note: in included file (through drivers/=
acpi/acpica/accommon.h):
   drivers/acpi/acpica/acglobal.h:27:1: sparse: sparse: symbol 'acpi_gbl_CD=
AT' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:28:1: sparse: sparse: symbol 'acpi_gbl_ds=
dt_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:29:1: sparse: sparse: symbol 'acpi_gbl_fa=
cs_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:30:1: sparse: sparse: symbol 'acpi_gbl_xf=
acs_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:31:1: sparse: sparse: symbol 'acpi_gbl_fa=
dt_index' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:119:1: sparse: sparse: symbol 'acpi_gbl_s=
tartup_flags' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:120:1: sparse: sparse: symbol 'acpi_gbl_s=
hutdown' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:121:1: sparse: sparse: symbol 'acpi_gbl_e=
arly_initialization' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:141:1: sparse: sparse: symbol 'acpi_gbl_n=
amespace_initialized' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:213:1: sparse: sparse: symbol 'acpi_gbl_c=
urrent_scope' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:217:1: sparse: sparse: symbol 'acpi_gbl_c=
apture_comments' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:218:1: sparse: sparse: symbol 'acpi_gbl_l=
ast_list_head' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:276:1: sparse: sparse: symbol 'acpi_gbl_d=
b_output_flags' was not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:0: sparse: sparse: missing terminating ' character
>> builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =C9
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =F9
   builtin:2:163: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:163: sparse: sparse: got =B9
   builtin:2:195: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:195: sparse: sparse: got =B9
   builtin:2:259: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:259: sparse: sparse: got =B9
   builtin:3:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:19: sparse: sparse: got =B9
   builtin:3:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:59: sparse: sparse: got =B9
   builtin:3:91: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:91: sparse: sparse: got =B9
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol '_' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =C3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:15:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:20: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:20: sparse: sparse: got =D0
   builtin:2:28: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:28: sparse: sparse: got =D0
   builtin:2:60: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:60: sparse: sparse: got =D0
   builtin:2:92: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:92: sparse: sparse: got =D0
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got =90
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:15:0: sparse: sparse: missing terminating " character
   builtin:20:0: sparse: sparse: missing terminating " character
   builtin:25:0: sparse: sparse: missing terminating " character
   builtin:28:0: sparse: sparse: missing terminating " character
   builtin:41:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ?
   builtin:2:340: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:340: sparse: sparse: got =EF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:223: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =DF
   builtin:3:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:19: sparse: sparse: got =0E
   builtin:3:63: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:63: sparse: sparse: got =0E
   builtin:3:95: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:95: sparse: sparse: got =0E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =9F
   builtin:2:332: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:332: sparse: sparse: got =A6
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =B8
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:28:0: sparse: sparse: missing terminating " character
   builtin:41:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FD
   builtin:4:31: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:31: sparse: sparse: got =0F
   builtin:24:34: sparse: sparse: Expected ; at the end of type declaration
   builtin:24:34: sparse: sparse: got =E9
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
