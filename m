Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA428E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689536312; x=1721072312;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7O56MaTHdTvLZzPNHNdG5nPcditn/Wrd8Z93UKW5uh0=;
  b=k3Mji4/T1En1BTEkQD3JS2HiukLmJA77EhxnXsuB8EhMgziQjqiRbuyQ
   7jKoEe0+HDjEXIxmYPzidhLr26J0vXJOpG4LFahgKc+Hxq0Z83y/RPaPY
   aMrndM0B9v9aShDZiPXYRmgf2fOsKKne+XErtamI780Sd6e/j95GvPMXQ
   OI53K/t1q7B1rSY+Dh4tT2j0DAVeuV2abbU1sL3BKo5rR0Y76SHR73kPI
   /5+hjn4L2oFxdz2kCX0/H4imWdLKjA89ElcMkmQmnEq2IwZDwfQHh4bBZ
   SQydxiXcnIEs67+hv6K3wHGKxgfb0Hr/SBef9wcCGt1sVsodCC3VxE1LH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="429548943"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="429548943"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 12:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="836662180"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="836662180"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2023 12:38:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL7Zc-0008yC-1k;
	Sun, 16 Jul 2023 19:38:28 +0000
Date: Mon, 17 Jul 2023 03:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Nick Alcock <nick.alcock@oracle.com>
Subject: [oracle-dtrace:v2/6.4 1/13] builtin:2:0: sparse: sparse: missing
 terminating " character
Message-ID: <202307170301.I6jfR0wj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: e3918b25463fd1c00b262ba25bb20ea0fcd08323 [1/13] kbuild: add modules=
=2Ebuiltin.objs
config: i386-randconfig-i063-20230716 (https://download.01.org/0day-ci/arch=
ive/20230717/202307170301.I6jfR0wj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170301.I=
6jfR0wj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170301.I6jfR0wj-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
>> builtin:2:218: sparse: sparse: End of file in middle of string
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
   builtin:2:225: sparse: sparse: no newline at end of file
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
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:22:0: sparse: sparse: missing terminating " character
   builtin:36:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =97
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
   builtin:38:7: sparse: sparse: no newline at end of file
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
   builtin:2:2: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:2: sparse: sparse: got =C7
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
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =BF
   builtin:2:66: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:66: sparse: sparse: got =E9
   builtin:2:98: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:98: sparse: sparse: got =E9
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
   builtin:2:26: sparse: sparse: got =1F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:225: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:30: sparse: sparse: Expected ; at end of declaration
   builtin:2:30: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:27: sparse: sparse: symbol 'OdU' was not declared. Should it b=
e static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =8B
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
   builtin:2:1: sparse: sparse: got =A3
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
   builtin:2:1: sparse: sparse: got =C1
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
   builtin:2:13: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:13: sparse: sparse: got =7F
   builtin:2:27: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:27: sparse: sparse: got =B1
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
   builtin:2:2: sparse: sparse: got =FF
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'k' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:15:0: sparse: sparse: missing terminating ' character
   builtin:18:121: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =A7
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
   builtin:2:1: sparse: sparse: got =96
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
   builtin:2:1: sparse: sparse: got =FB
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
   builtin:2:68: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:68: sparse: sparse: got =FF
   builtin:2:100: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:100: sparse: sparse: got =FF
   builtin:2:124: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:124: sparse: sparse: got =FF
   builtin:2:132: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:132: sparse: sparse: got =FF
   builtin:2:140: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:140: sparse: sparse: got =FF
   builtin:2:148: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:148: sparse: sparse: got =FF
   builtin:2:156: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:156: sparse: sparse: got =FF
   builtin:2:164: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:164: sparse: sparse: got =FF
   builtin:2:172: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:172: sparse: sparse: got =FF
   builtin:2:180: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:180: sparse: sparse: got =FF
   builtin:2:188: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:188: sparse: sparse: got =FF
   builtin:2:196: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:196: sparse: sparse: got =FF
   builtin:2:204: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:204: sparse: sparse: got =FF
   builtin:2:212: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:212: sparse: sparse: got =FF
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
   builtin:2:1: sparse: sparse: got 41
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:218: sparse: sparse: End of file in middle of string
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:2: sparse: sparse: got 9
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
   builtin:2:3: sparse: sparse: got :
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
   builtin:7:0: sparse: sparse: missing terminating " character
   builtin:8:0: sparse: sparse: missing terminating " character
   builtin:38:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:10:193: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =18
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
   builtin:2:1: sparse: sparse: got =E7
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
   builtin:3:0: sparse: sparse: missing terminating ' character
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
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =87
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
   builtin:2:26: sparse: sparse: got =06
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:2: sparse: sparse: unrecognized preprocessor line '=F2=CA=0E =
=DB=9FV=FC=7FX=9Bg3ZU =10=92=CB>=7F=16=81=C7=A0=1C_2=F1=16=81#=C9=C7d=B7=F0=
=B8=D6=9FV=FC=7F=B8=D6=9FV=FC=7F~=02sY=EBj=AE'
   builtin:3:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:1: sparse: sparse: got
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
   builtin:2:26: sparse: sparse: got =04
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
   builtin:2:1: sparse: sparse: got =8E
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
   builtin:2:223: sparse: sparse: End of file in middle of string
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
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got :
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
   builtin:2:1: sparse: sparse: got 6-command-line: note: in included file =
(through builtin):
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
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =9C
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
   builtin:2:1: sparse: sparse: got =8A
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:218: sparse: sparse: End of file in middle of string
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
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got %
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:225: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =1E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =B3
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
   drivers/acpi/acpica/nspredef.c: note: in included file:
   drivers/acpi/acpica/acpredef.h:187:34: sparse: sparse: symbol 'acpi_gbl_=
predefined_methods' was not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:20: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:20: sparse: sparse: got =3D
   builtin:2:28: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:28: sparse: sparse: got =3D
   builtin:2:60: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:60: sparse: sparse: got =3D
   builtin:2:92: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:92: sparse: sparse: got =3D
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
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
   builtin:2:225: sparse: sparse: no newline at end of file
   builtin:2:225: sparse: sparse: End of file in middle of string
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
   builtin:2:1: sparse: sparse: got =D1
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
   builtin:2:1: sparse: sparse: got =F1
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
   builtin:2:2: sparse: sparse: got }
   builtin:2:20: sparse: sparse: Expected ; at end of declaration
   builtin:2:20: sparse: sparse: got
   builtin:2:76: sparse: sparse: Expected ; at end of declaration
   builtin:2:76: sparse: sparse: got
   builtin:5:12: sparse: sparse: Expected ; at end of declaration
   builtin:5:12: sparse: sparse: got
   builtin:5:20: sparse: sparse: Expected ; at end of declaration
   builtin:5:20: sparse: sparse: got
   builtin:5:52: sparse: sparse: Expected ; at end of declaration
   builtin:5:52: sparse: sparse: got
   builtin:5:84: sparse: sparse: Expected ; at end of declaration
   builtin:5:84: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:18: sparse: sparse: symbol 'mU' was not declared. Should it be=
 static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =95
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
   builtin:2:1: sparse: sparse: got =BE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =98
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
   builtin:2:1: sparse: sparse: got =C8
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:12:121: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =F6
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
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got "Y=DEU
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
   builtin:2:2: sparse: sparse: got =FD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'r' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:16:127: sparse: sparse: no newline at end of file
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got
   builtin:11:18: sparse: sparse: Expected ; at the end of type declaration
   builtin:11:18: sparse: sparse: got 3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'DV' was not declared. Should it be =
static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got ~
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
   builtin:2:1: sparse: sparse: got =91
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
   builtin:2:2: sparse: sparse: got =81
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'f' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:38:7: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FD
   builtin:10:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:10:1: sparse: sparse: got =FD
   builtin:11:7: sparse: sparse: Expected ; at the end of type declaration
   builtin:11:7: sparse: sparse: got =1A
   builtin:15:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:15:1: sparse: sparse: got =FD
   builtin:16:7: sparse: sparse: Expected ; at the end of type declaration
   builtin:16:7: sparse: sparse: got =1A
   builtin:17:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:17:1: sparse: sparse: got =FD
   builtin:18:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:18:1: sparse: sparse: got =FD
   builtin:19:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:19:1: sparse: sparse: got =FD
   builtin:20:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:20:1: sparse: sparse: got =FD
   builtin:21:7: sparse: sparse: Expected ; at the end of type declaration
   builtin:21:7: sparse: sparse: got =1A
   builtin:22:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:22:1: sparse: sparse: got =FD
   builtin:23:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:23:1: sparse: sparse: got =FD
   builtin:24:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:24:26: sparse: sparse: got =1A
   builtin:25:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:25:1: sparse: sparse: got =FD
   builtin:26:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:26:1: sparse: sparse: got =FD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
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
   builtin:2:1: sparse: sparse: got =7F
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
   builtin:5:222: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =03
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
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =F3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:11:0: sparse: sparse: missing terminating " character
   builtin:13:0: sparse: sparse: missing terminating ' character
   builtin:17:127: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got }
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:218: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =8F
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
   builtin:3:218: sparse: sparse: End of file in middle of string
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
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =F5
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
   builtin:2:1: sparse: sparse: got =88
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:157:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:157:1: sparse: sparse: got }
   include/linux/compiler_types.h:144:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
