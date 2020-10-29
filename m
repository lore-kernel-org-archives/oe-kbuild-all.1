Content-Type: multipart/mixed; boundary="===============1536629378205993212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not used
Date: Fri, 30 Oct 2020 02:00:17 +0800
Message-ID: <202010300212.AMprelcZ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1536629378205993212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jordan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
commit: 650b55b707fdfa764e9f2b81314d3eb4216fb962 powerpc: Add prefixed inst=
ructions to instruction data type
date:   5 months ago
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D650b55b707fdfa764e9f2b81314d3eb4216fb962
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 650b55b707fdfa764e9f2b81314d3eb4216fb962
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not u=
sed [-Werror=3Dunused-but-set-variable]
    1172 |  unsigned int word, suffix;
         |                     ^~~~~~
   arch/powerpc/lib/sstep.c:1168:31: error: variable 'rc' set but not used =
[-Werror=3Dunused-but-set-variable]
    1168 |  unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                               ^~
   cc1: all warnings being treated as errors

vim +/suffix +1172 arch/powerpc/lib/sstep.c

  1153	=

  1154	/*
  1155	 * Decode an instruction, and return information about it in *op
  1156	 * without changing *regs.
  1157	 * Integer arithmetic and logical instructions, branches, and barrier
  1158	 * instructions can be emulated just using the information in *op.
  1159	 *
  1160	 * Return value is 1 if the instruction can be emulated just by
  1161	 * updating *regs with the information in *op, -1 if we need the
  1162	 * GPRs but *regs doesn't contain the full register set, or 0
  1163	 * otherwise.
  1164	 */
  1165	int analyse_instr(struct instruction_op *op, const struct pt_regs *r=
egs,
  1166			  struct ppc_inst instr)
  1167	{
  1168		unsigned int opcode, ra, rb, rc, rd, spr, u;
  1169		unsigned long int imm;
  1170		unsigned long int val, val2;
  1171		unsigned int mb, me, sh;
> 1172		unsigned int word, suffix;
  1173		long ival;
  1174	=

  1175		word =3D ppc_inst_val(instr);
  1176		suffix =3D ppc_inst_suffix(instr);
  1177	=

  1178		op->type =3D COMPUTE;
  1179	=

  1180		opcode =3D ppc_inst_primary_opcode(instr);
  1181		switch (opcode) {
  1182		case 16:	/* bc */
  1183			op->type =3D BRANCH;
  1184			imm =3D (signed short)(word & 0xfffc);
  1185			if ((word & 2) =3D=3D 0)
  1186				imm +=3D regs->nip;
  1187			op->val =3D truncate_if_32bit(regs->msr, imm);
  1188			if (word & 1)
  1189				op->type |=3D SETLK;
  1190			if (branch_taken(word, regs, op))
  1191				op->type |=3D BRTAKEN;
  1192			return 1;
  1193	#ifdef CONFIG_PPC64
  1194		case 17:	/* sc */
  1195			if ((word & 0xfe2) =3D=3D 2)
  1196				op->type =3D SYSCALL;
  1197			else
  1198				op->type =3D UNKNOWN;
  1199			return 0;
  1200	#endif
  1201		case 18:	/* b */
  1202			op->type =3D BRANCH | BRTAKEN;
  1203			imm =3D word & 0x03fffffc;
  1204			if (imm & 0x02000000)
  1205				imm -=3D 0x04000000;
  1206			if ((word & 2) =3D=3D 0)
  1207				imm +=3D regs->nip;
  1208			op->val =3D truncate_if_32bit(regs->msr, imm);
  1209			if (word & 1)
  1210				op->type |=3D SETLK;
  1211			return 1;
  1212		case 19:
  1213			switch ((word >> 1) & 0x3ff) {
  1214			case 0:		/* mcrf */
  1215				op->type =3D COMPUTE + SETCC;
  1216				rd =3D 7 - ((word >> 23) & 0x7);
  1217				ra =3D 7 - ((word >> 18) & 0x7);
  1218				rd *=3D 4;
  1219				ra *=3D 4;
  1220				val =3D (regs->ccr >> ra) & 0xf;
  1221				op->ccval =3D (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1222				return 1;
  1223	=

  1224			case 16:	/* bclr */
  1225			case 528:	/* bcctr */
  1226				op->type =3D BRANCH;
  1227				imm =3D (word & 0x400)? regs->ctr: regs->link;
  1228				op->val =3D truncate_if_32bit(regs->msr, imm);
  1229				if (word & 1)
  1230					op->type |=3D SETLK;
  1231				if (branch_taken(word, regs, op))
  1232					op->type |=3D BRTAKEN;
  1233				return 1;
  1234	=

  1235			case 18:	/* rfid, scary */
  1236				if (regs->msr & MSR_PR)
  1237					goto priv;
  1238				op->type =3D RFI;
  1239				return 0;
  1240	=

  1241			case 150:	/* isync */
  1242				op->type =3D BARRIER | BARRIER_ISYNC;
  1243				return 1;
  1244	=

  1245			case 33:	/* crnor */
  1246			case 129:	/* crandc */
  1247			case 193:	/* crxor */
  1248			case 225:	/* crnand */
  1249			case 257:	/* crand */
  1250			case 289:	/* creqv */
  1251			case 417:	/* crorc */
  1252			case 449:	/* cror */
  1253				op->type =3D COMPUTE + SETCC;
  1254				ra =3D (word >> 16) & 0x1f;
  1255				rb =3D (word >> 11) & 0x1f;
  1256				rd =3D (word >> 21) & 0x1f;
  1257				ra =3D (regs->ccr >> (31 - ra)) & 1;
  1258				rb =3D (regs->ccr >> (31 - rb)) & 1;
  1259				val =3D (word >> (6 + ra * 2 + rb)) & 1;
  1260				op->ccval =3D (regs->ccr & ~(1UL << (31 - rd))) |
  1261					(val << (31 - rd));
  1262				return 1;
  1263			}
  1264			break;
  1265		case 31:
  1266			switch ((word >> 1) & 0x3ff) {
  1267			case 598:	/* sync */
  1268				op->type =3D BARRIER + BARRIER_SYNC;
  1269	#ifdef __powerpc64__
  1270				switch ((word >> 21) & 3) {
  1271				case 1:		/* lwsync */
  1272					op->type =3D BARRIER + BARRIER_LWSYNC;
  1273					break;
  1274				case 2:		/* ptesync */
  1275					op->type =3D BARRIER + BARRIER_PTESYNC;
  1276					break;
  1277				}
  1278	#endif
  1279				return 1;
  1280	=

  1281			case 854:	/* eieio */
  1282				op->type =3D BARRIER + BARRIER_EIEIO;
  1283				return 1;
  1284			}
  1285			break;
  1286		}
  1287	=

  1288		/* Following cases refer to regs->gpr[], so we need all regs */
  1289		if (!FULL_REGS(regs))
  1290			return -1;
  1291	=

  1292		rd =3D (word >> 21) & 0x1f;
  1293		ra =3D (word >> 16) & 0x1f;
  1294		rb =3D (word >> 11) & 0x1f;
  1295		rc =3D (word >> 6) & 0x1f;
  1296	=

  1297		switch (opcode) {
  1298	#ifdef __powerpc64__
  1299		case 2:		/* tdi */
  1300			if (rd & trap_compare(regs->gpr[ra], (short) word))
  1301				goto trap;
  1302			return 1;
  1303	#endif
  1304		case 3:		/* twi */
  1305			if (rd & trap_compare((int)regs->gpr[ra], (short) word))
  1306				goto trap;
  1307			return 1;
  1308	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1536629378205993212==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1536629378205993212==--

