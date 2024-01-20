Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC38D2F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705764832; cv=none; b=qZmm4AQIAS08SpTgex7vdb5m/u1/lpOckOnc/XxhwH/h+5+v1tspOSt9mXTQHNQYYXRghOooL9AqFapve7zdS3KdO6hXrsE+sMmwnvbAYIlgxG0LqyrbyaGdcHvPAB/rdJoFguiwLu0iky/iv+yXto1ZZ9U8BWbRTZvfenR6JiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705764832; c=relaxed/simple;
	bh=ZtOYrpv2/se2/Z6DJ3xKzcbtfg4R4hPKtdcRVTyTe+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/hpodCb+vjdz+bH3qGr0UKuh0C2gEv7HkO1xbX8XtSpKt5IhX0GTV6sdLKL6siEzAfBhJ7uAuUNnNPj920l/pMS8VvMQOWlF95aU9NdsMjH98LTuPJVs6TC2OQ+mG3g9RYIxLH8S5iYGfo2qq7FV1I3DiLQEz8fyXhsj7qImi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMqfViRr; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMqfViRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705764827; x=1737300827;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZtOYrpv2/se2/Z6DJ3xKzcbtfg4R4hPKtdcRVTyTe+A=;
  b=AMqfViRrGvoxYQsE/kiEGTny2Ln3wHax2M/McB7Nigr3YKxg/Yb5vdvP
   rXqQ2uH/rfItfVEmfi2bbrNOr1Oka7duUD/Xx6YoMqdxVOthFLHuxoS6y
   8oMprL/Gg1ZHdHF7etpjwU1D8d6JxMXexPU2xSkliv7YeaeEnO7LNqSno
   AX9l2yGiDbE0Fn/cl9mz4iFu/GGL6M10NeFzNYPVGSTBafobJ1vN07BPe
   4JFVYGrUYu8AZ5V0UGH7UkPyZoecu7tIjiWam5QFddtrCLlB1jxzBXcj1
   AwR7IrmzTVlE+tYelRq3NLVJhR3pA8N4tKvZgmps/aQ02Z5PiF4oqIsjj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="432122192"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="432122192"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 07:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="26986712"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2024 07:33:44 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRDLp-0005Cy-1y;
	Sat, 20 Jan 2024 15:33:41 +0000
Date: Sat, 20 Jan 2024 23:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Nick Alcock <nick.alcock@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>
Subject: [oracle-dtrace:v2/6.7 1/11] builtin:2:0: sparse: sparse: missing
 terminating " character
Message-ID: <202401202301.MmspmxYb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.7
head:   59b53403fac6433487b678d487564fa2ee67f229
commit: 105aecdb38625c8adc8b0d1c90ec56b3577c85f1 [1/11] kbuild: add modules=
=2Ebuiltin.objs
config: x86_64-randconfig-121-20240120 (https://download.01.org/0day-ci/arc=
hive/20240120/202401202301.MmspmxYb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240120/202401202301.MmspmxYb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202301.MmspmxYb-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
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
   include/acpi/acpixf.h:259:1: sparse: sparse: symbol 'acpi_gbl_method_exe=
cuting' was not declared. Should it be static?
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
   drivers/acpi/acpica/acglobal.h:142:1: sparse: sparse: symbol 'acpi_gbl_n=
amespace_initialized' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:201:1: sparse: sparse: symbol 'acpi_gbl_n=
esting_level' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:214:1: sparse: sparse: symbol 'acpi_gbl_c=
urrent_scope' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:218:1: sparse: sparse: symbol 'acpi_gbl_c=
apture_comments' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:219:1: sparse: sparse: symbol 'acpi_gbl_l=
ast_list_head' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:277:1: sparse: sparse: symbol 'acpi_gbl_d=
b_output_flags' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:301:1: sparse: sparse: symbol 'acpi_gbl_a=
bort_method' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:302:1: sparse: sparse: symbol 'acpi_gbl_d=
b_thread_id' was not declared. Should it be static?
   drivers/acpi/acpica/acglobal.h:303:1: sparse: sparse: symbol 'acpi_gbl_n=
ext_cmd_num' was not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:275: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:185: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:185: sparse: sparse: got =BE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:275: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:185: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:185: sparse: sparse: got =8E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:5:475: sparse: sparse: no newline at end of file
   builtin:5:475: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:4:195: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =A5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'q' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:8:275: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =BB
   builtin:3:78: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:78: sparse: sparse: got =FA
   builtin:3:86: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:86: sparse: sparse: got
   builtin:7:95: sparse: sparse: Expected ; at the end of type declaration
   builtin:7:95: sparse: sparse: got =FE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:6:0: sparse: sparse: missing terminating ' character
   builtin:6:267: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got ~
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:611: sparse: sparse: End of file in middle of string
   builtin:3:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:507: sparse: sparse: no newline at end of file
   builtin:6:507: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =7F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:4:0: sparse: sparse: missing terminating ' character
   builtin:6:619: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got '=8FU
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:3:267: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got 48y
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =95
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:2:3: sparse: sparse: Expected ; at end of declaration
   builtin:2:3: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'NZ' was not declared. Should it be =
static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:619: sparse: sparse: no newline at end of file
   builtin:2:619: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:5:507: sparse: sparse: no newline at end of file
   builtin:5:507: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:27: sparse: sparse: Expected ; at end of declaration
   builtin:2:27: sparse: sparse: got =C3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:26: sparse: sparse: symbol 'J' was not declared. Should it be =
static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:108:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =BC
   builtin:8:5: sparse: sparse: Expected ; at the end of type declaration
   builtin:8:5: sparse: sparse: got 2
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FB
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:611: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =04
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 's' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:275: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:5:48: sparse: sparse: Expected ; at the end of type declaration
   builtin:5:48: sparse: sparse: got =0E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:51: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:4:27: sparse: sparse: Expected ; at end of declaration
   builtin:4:27: sparse: sparse: got =F5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:4:25: sparse: sparse: symbol 'bH' was not declared. Should it be=
 static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =BB
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:275: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =95
   builtin:3:185: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:185: sparse: sparse: got =CE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'b' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:26:0: sparse: sparse: missing terminating ' character
   builtin:45:283: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:3:195: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:3:275: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:467: sparse: sparse: no newline at end of file
   builtin:6:467: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:5:0: sparse: sparse: missing terminating ' character
   builtin:5:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got '.=7F
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:7:619: sparse: sparse: no newline at end of file
   builtin:7:619: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =11
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:68: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:68: sparse: sparse: got =FC
   builtin:2:100: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:100: sparse: sparse: got =FC
   builtin:2:124: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:124: sparse: sparse: got =FC
   builtin:2:132: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:132: sparse: sparse: got =FC
   builtin:2:140: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:140: sparse: sparse: got =FC
   builtin:2:148: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:148: sparse: sparse: got =FC
   builtin:2:156: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:156: sparse: sparse: got =FC
   builtin:2:164: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:164: sparse: sparse: got =FC
   builtin:2:172: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:172: sparse: sparse: got =FC
   builtin:2:180: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:180: sparse: sparse: got =FC
   builtin:2:188: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:188: sparse: sparse: got =FC
   builtin:2:196: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:196: sparse: sparse: got =FC
   builtin:2:204: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:204: sparse: sparse: got =FC
   builtin:2:212: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:212: sparse: sparse: got =FC
   builtin:2:220: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:220: sparse: sparse: got =FC
   builtin:2:228: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:228: sparse: sparse: got =FC
   builtin:2:236: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:236: sparse: sparse: got =FC
   builtin:2:244: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:244: sparse: sparse: got =FC
   builtin:2:252: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:252: sparse: sparse: got =FC
   builtin:2:260: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:260: sparse: sparse: got =FC
   builtin:2:268: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:268: sparse: sparse: got =FC
   builtin:2:276: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:276: sparse: sparse: got =FC
   builtin:2:284: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:284: sparse: sparse: got =FC
   builtin:2:292: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:292: sparse: sparse: got =FC
   builtin:2:300: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:300: sparse: sparse: got =FC
   builtin:2:308: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:308: sparse: sparse: got =FC
   builtin:2:316: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:316: sparse: sparse: got =FC
   builtin:2:324: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:324: sparse: sparse: got =FC
   builtin:2:332: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:332: sparse: sparse: got =FC
   builtin:2:340: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:340: sparse: sparse: got =FC
   builtin:2:348: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:348: sparse: sparse: got =FC
   builtin:2:356: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:356: sparse: sparse: got =FC
   builtin:2:364: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:364: sparse: sparse: got =FC
   builtin:2:372: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:372: sparse: sparse: got =FC
   builtin:2:380: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:380: sparse: sparse: got =FC
   builtin:2:388: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:388: sparse: sparse: got =FC
   builtin:2:396: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:396: sparse: sparse: got =FC
   builtin:2:404: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:404: sparse: sparse: got =FC
   builtin:2:412: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:412: sparse: sparse: got =FC
   builtin:3:4: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:4: sparse: sparse: got =FC
   builtin:3:12: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:12: sparse: sparse: got =FC
   builtin:3:20: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:20: sparse: sparse: got =FC
   builtin:3:28: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:28: sparse: sparse: got =FC
   builtin:3:36: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:36: sparse: sparse: got =FC
   builtin:3:44: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:44: sparse: sparse: got =FC
   builtin:3:52: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:52: sparse: sparse: got =FC
   builtin:3:60: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:60: sparse: sparse: got =FC
   builtin:3:68: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:68: sparse: sparse: got =FC
   builtin:3:76: sparse: sparse: Expected ; at the end of type declaration
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:611: sparse: sparse: no newline at end of file
   builtin:6:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =08
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =AD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:7:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:19: sparse: sparse: got =9E
   builtin:2:27: sparse: sparse: Expected ; at end of declaration
   builtin:2:27: sparse: sparse: got =9E
   builtin:2:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:59: sparse: sparse: got =9E
   builtin:2:91: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:91: sparse: sparse: got =9E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got 6
   builtin:3:16: sparse: sparse: Expected ; at end of declaration
   builtin:3:16: sparse: sparse: got =E8
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:3:15: sparse: sparse: symbol 'b' was not declared. Should it be =
static?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:7:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:195: sparse: sparse: no newline at end of file
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =C4
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   builtin:2:1: sparse: sparse: symbol 'f' was not declared. Should it be s=
tatic?
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:3:195: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =FD
   builtin:6:6: sparse: sparse: Expected ; at the end of type declaration
   builtin:6:6: sparse: sparse: got =82
   builtin:40:6: sparse: sparse: Expected ; at the end of type declaration
   builtin:40:6: sparse: sparse: got ~
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:4:619: sparse: sparse: no newline at end of file
   builtin:4:619: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got }
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:275: sparse: sparse: no newline at end of file
   builtin:3:275: sparse: sparse: End of file in middle of string
   builtin:3:3: sparse: sparse: unrecognized preprocessor line '=7F=FE=7F=
=16 #=7F=FE=7FL #=7F=FE=7FU #=7F=FE=7F=82 #=7F=FE=7F=8B #=7F=FE=7F=BF #=7F=
=FE=7F=CC #=7F=FE=7F=F6 #=7F=FE=7F=FE #=7F=FE=7F=13!#=7F=FE=7F=1E!#=7F=FE=
=7F,!#=7F=FE=7F<!#=7F=FE=7FH!#=7F=FE=7FQ!#=7F=FE=7Ff!#=7F=FE=7Fo!#=7F=FE=7F=
x!#=7F=FE=7F=82!#=7F=FE=7F=8D!#=7F=FE=7F=96!#=7F=FE=7F=AB!#=7F=FE=7F=B0!#=
=7F=FE=7F=C0!#=7F=FE=7F=D0!#=7F=FE=7F=DB!#=7F=FE=7F=EE!#=7F=FE=7F "#=7F=FE=
=7F#=7F=FE=7F+"#=7F=FE=7F#=7F=FE=7FI"#=7F=FE=7F#=7F=FE=7F{'
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:185: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:185: sparse: sparse: got =1E
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:611: sparse: sparse: no newline at end of file
   builtin:6:611: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got {
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:0: sparse: sparse: missing terminating ' character
   builtin:3:267: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got 5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:7:523: sparse: sparse: no newline at end of file
   builtin:7:523: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =C3
   builtin:3:56: sparse: sparse: Expected ; at the end of type declaration
   builtin:3:56: sparse: sparse: got =10
   builtin:5:8: sparse: sparse: Expected ; at the end of type declaration
   builtin:5:8: sparse: sparse: got =10
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:195: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:22: sparse: sparse: Expected ; at end of declaration
   builtin:2:22: sparse: sparse: got
   builtin:2:30: sparse: sparse: Expected ; at end of declaration
   builtin:2:30: sparse: sparse: got
   builtin:2:62: sparse: sparse: Expected ; at end of declaration
   builtin:2:62: sparse: sparse: got
   builtin:2:94: sparse: sparse: Expected ; at end of declaration
   builtin:2:94: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
   drivers/acpi/acpica/nspredef.c: note: in included file:
   drivers/acpi/acpica/acpredef.h:187:34: sparse: sparse: symbol 'acpi_gbl_=
predefined_methods' was not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:6:0: sparse: sparse: missing terminating " character
   builtin:7:611: sparse: sparse: no newline at end of file
   builtin:7:611: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =BD
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:619: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:88:1: sparse: sparse: no newline at end of file
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =D2
   builtin:4:39: sparse: sparse: Expected ; at the end of type declaration
   builtin:4:39: sparse: sparse: got =E2
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:625: sparse: sparse: no newline at end of file
   builtin:2:625: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:19: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:19: sparse: sparse: got =D0
   builtin:2:59: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:59: sparse: sparse: got =D0
   builtin:2:91: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:91: sparse: sparse: got =D0
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =E3
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:9:0: sparse: sparse: missing terminating " character
   builtin:11:523: sparse: sparse: no newline at end of file
   builtin:11:523: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got =E8
   builtin:7:73: sparse: sparse: Expected ; at the end of type declaration
   builtin:7:73: sparse: sparse: got =CE
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:123: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:123: sparse: sparse: got =F1
   builtin:2:131: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:131: sparse: sparse: got =F1
   builtin:2:139: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:139: sparse: sparse: got =F1
   builtin:2:147: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:147: sparse: sparse: got =F1
   builtin:2:155: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:155: sparse: sparse: got =F1
   builtin:2:163: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:163: sparse: sparse: got =F1
   builtin:2:171: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:171: sparse: sparse: got =F1
   builtin:2:179: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:179: sparse: sparse: got =F1
   builtin:2:187: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:187: sparse: sparse: got =F1
   builtin:2:195: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:195: sparse: sparse: got =F1
   builtin:2:203: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:203: sparse: sparse: got =F1
   builtin:2:211: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:211: sparse: sparse: got =F1
   builtin:2:219: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:219: sparse: sparse: got =F1
   builtin:2:227: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:227: sparse: sparse: got =F1
   builtin:2:235: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:235: sparse: sparse: got =F1
   builtin:2:243: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:243: sparse: sparse: got =F1
   builtin:2:251: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:251: sparse: sparse: got =F1
   builtin:2:259: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:259: sparse: sparse: got =F1
   builtin:2:267: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:267: sparse: sparse: got =F1
   builtin:2:275: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:275: sparse: sparse: got =F1
   builtin:2:283: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:283: sparse: sparse: got =F1
   builtin:2:291: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:291: sparse: sparse: got =F1
   builtin:2:299: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:299: sparse: sparse: got =F1
   builtin:2:307: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:307: sparse: sparse: got =F1
   builtin:2:315: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:315: sparse: sparse: got =F1
   builtin:2:323: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:323: sparse: sparse: got =F1
   builtin:2:331: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:331: sparse: sparse: got =F1
   builtin:2:339: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:339: sparse: sparse: got =F1
   builtin:2:347: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:347: sparse: sparse: got =F1
   builtin:2:355: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:355: sparse: sparse: got =F1
   builtin:2:363: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:363: sparse: sparse: got =F1
   builtin:2:371: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:371: sparse: sparse: got =F1
   builtin:2:379: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:379: sparse: sparse: got =F1
   builtin:2:387: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:387: sparse: sparse: got =F1
   builtin:2:395: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:395: sparse: sparse: got =F1
   builtin:2:403: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:403: sparse: sparse: got =F1
   builtin:2:411: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:411: sparse: sparse: got =F1
   builtin:2:419: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:419: sparse: sparse: got =F1
   builtin:2:427: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:427: sparse: sparse: got =F1
   builtin:2:435: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:435: sparse: sparse: got =F1
   builtin:2:443: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:443: sparse: sparse: got =F1
   builtin:2:451: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:451: sparse: sparse: got =F1
   builtin:2:459: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:459: sparse: sparse: got =F1
   builtin:2:467: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:467: sparse: sparse: got =F1
   builtin:2:475: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:475: sparse: sparse: got =F1
   builtin:2:483: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:483: sparse: sparse: got =F1
   builtin:2:491: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:491: sparse: sparse: got =F1
   builtin:2:499: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:499: sparse: sparse: got =F1
   builtin:2:507: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:507: sparse: sparse: got =F1
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:27: sparse: sparse: Expected ; at end of declaration
   builtin:2:27: sparse: sparse: got =17
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:107: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:107: sparse: sparse: got =D5
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:3:611: sparse: sparse: no newline at end of file
   builtin:3:611: sparse: sparse: End of file in middle of string
   builtin:2:2: sparse: sparse: Expected ; at end of declaration
   builtin:2:2: sparse: sparse: got =9C
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   command-line: note: in included file:
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?
--
   command-line: note: in included file:
>> builtin:2:0: sparse: sparse: missing terminating " character
   builtin:2:611: sparse: sparse: no newline at end of file
>> builtin:2:611: sparse: sparse: End of file in middle of string
   builtin:2:1: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:1: sparse: sparse: got
   builtin:2:26: sparse: sparse: Expected ; at the end of type declaration
   builtin:2:26: sparse: sparse: got =EB
   command-line: note: in included file (through builtin):
   include/linux/compiler_types.h:183:1: sparse: sparse: Expected ; at the =
end of type declaration
   include/linux/compiler_types.h:183:1: sparse: sparse: got }
   include/linux/compiler_types.h:170:20: sparse: sparse: symbol 'file' was=
 not declared. Should it be static?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
